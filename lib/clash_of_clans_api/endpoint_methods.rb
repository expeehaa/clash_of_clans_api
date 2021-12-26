require 'cgi'
require 'json'
require 'net/https'

module ClashOfClansApi
	module EndpointMethods
		def endpoint_headers
			{}
		end
		
		def perform_request(method, api_path, query: nil, body: nil, headers: nil)
			uri = self.base_uri + api_path
			uri.query = URI.encode_www_form(query) if query
			
			Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
				case method
				when :get
					Net::HTTP::Get
				when :post
					Net::HTTP::Post
				else
					raise ArgumentError, "Invalid method #{method.inspect}."
				end.new(uri).tap do |request|
					endpoint_headers.merge(headers || {}).each do |name, value|
						request[name] = value
					end
					
					if body
						request['Content-Type'] = 'application/json'
						request.body            = body
					end
				end.then do |request|
					http.request(request)
				end
			end
		end
		
		def transform_response(response)
			if response.is_a?(Net::HTTPSuccess)
				JSON.parse(response.body)
			else
				raise NoSuccessError.new(response)
			end
		end
		
		def self.included(klass)
			klass.extend(ClassMethods)
		end
		
		module ClassMethods
			def define_endpoint(name, method:, endpoint:, body: nil)
				define_method(name) do |*args, **kwargs|
					uri          = endpoint.respond_to?(:call) ? ClashOfClansApi::Utils.call_proc_without_unknown_keywords(endpoint, *args, **kwargs) : endpoint
					request_body = body    .respond_to?(:call) ? ClashOfClansApi::Utils.call_proc_without_unknown_keywords(body,     *args, **kwargs) : body
					
					perform_request(method, uri, body: request_body, query: kwargs.dig(:query), headers: kwargs.dig(:headers)).then do |response|
						if !kwargs.key?(:plain_response) || !kwargs.fetch(:plain_response)
							transform_response(response)
						else
							response
						end
					end
				end
			end
		end
	end
end
