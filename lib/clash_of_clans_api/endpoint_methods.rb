require 'cgi'
require 'json'
require 'net/https'

module ClashOfClansApi
	module EndpointMethods
		def endpoint_headers
			raise NotImplementedError
		end
		
		def perform_request(method, api_path, query: nil, body: nil, headers: nil)
			uri = self.class::BASE_URI+api_path
			uri.query = URI.encode_www_form(query) if query
			
			Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme=='https') do |http|
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
				case method
				when :get
					define_method(name) do |*args, **kwargs|
						uri = endpoint.respond_to?(:call) ? endpoint.call(*args, **kwargs) : endpoint
						
						transform_response(perform_request(:get, uri, query: kwargs.dig(:query), headers: kwargs.dig(:headers)))
					end
				when :post
					define_method(name) do |*args, **kwargs|
						uri          = endpoint.respond_to?(:call) ? endpoint.call(*args, **kwargs) : endpoint
						request_body = body.call(*args, **kwargs)
						
						transform_response(perform_request(:post, uri, body: request_body, query: kwargs.dig(:query), headers: kwargs.dig(:headers)))
					end
				else
					raise "Unsupported argument 'method: #{method.inspect}'"
				end
			end
			
			def url_escape(string)
				if !string.nil?
					CGI.escape(string.to_s)
				else
					raise TypeError, 'cannot escape nil'
				end
			end
		end
	end
end
