require 'cgi'
require_relative 'token_api'

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
		
		class << self
			def create!(email, password)
				new(email, password).login!
			end
		end
	end
end
