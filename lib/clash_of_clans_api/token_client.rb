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
					raise ApiFrame::NoSuccessError, response
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
				Models::Token.new(key, self)
			end
		end
		
		def create_api_key(name, description, ip_addresses)
			response = TokenApi.apikey_create(name: name, description: description, ip_addresses: (ip_addresses.is_a?(Array) ? ip_addresses : [ip_addresses]), headers: @session_headers)
			
			Models::Token.new(response['key'], self)
		end
		
		def revoke_api_key(id)
			TokenApi.apikey_revoke(id: id, headers: @session_headers)
		end
		
		def create_or_get_api_key_for_current_ipv4_address(name, description=name, overwrite: false)
			current_ipv4 = ClashOfClansApi::Utils.current_ipv4_address
			token        = list_api_keys.select{ |i| i.name == name }.first
			
			if token && token.cidr_ranges.include?(current_ipv4)
				token
			elsif (token && overwrite) || !token
				token&.revoke
				create_api_key(name, description, current_ipv4)
			else
				false
			end
		end
		
		class << self
			def create!(email, password)
				new(email, password).login!
			end
		end
	end
end
