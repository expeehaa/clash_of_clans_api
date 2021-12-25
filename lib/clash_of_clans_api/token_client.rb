require 'cgi'
require_relative 'token_api'
require_relative 'models/token'

module ClashOfClansApi
	class TokenClient
		attr_reader :email
		attr_reader :password
		
		def initialize(email, password)
			@email    = email
			@password = password
		end
		
		def login!
			TokenApi.login(email: email, password: password, plain_response: true).tap do |response|
				if response.is_a?(Net::HTTPSuccess)
					cookies = CGI::Cookie.parse(response['set-cookie'])
					
					@session_headers = {
						'Cookie' => "session=#{cookies['session'][0]}",
					}
				else
					raise NoSuccessError, response
				end
			end
		end
		
		def logout
			TokenApi.logout(headers: @session_headers)
		ensure
			@session_headers = nil
		end
		
		def list_api_keys
			response = TokenApi.apikey_list(headers: @session_headers)
			
			response['keys'].map do |key|
				Models::Token.new(key, token_client: self)
			end
		end
		
		def create_api_key(name, description, ip_addresses)
			response = TokenApi.apikey_create(name: name, description: description, ip_addresses: (ip_addresses.is_a?(Array) ? ip_addresses : [ip_addresses]), headers: @session_headers)
			
			Models::Token.new(response['key'], token_client: self)
		end
		
		def revoke_api_key(id)
			TokenApi.apikey_revoke(id: id, headers: @session_headers)
			
			true
		end
		
		class << self
			def create!(email, password)
				new(email, password).login!
			end
		end
	end
end
