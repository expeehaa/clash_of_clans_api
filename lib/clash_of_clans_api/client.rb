require_relative 'api'

module ClashOfClansApi
	class Client
		attr_reader :api
		
		def initialize(api_token)
			@api = Api.new(api_token)
		end
		
		def authorized?
			api.perform_get('test').code == '404'
		end
		
		def player_verifytoken(player_tag, token)
			response = api.player_verifytoken(player_tag, token: token)
			
			raise "Sent player tag #{player_tag.inspect} but received #{response['tag'  ].inspect}." unless player_tag == response['tag'  ]
			raise "Sent token #{     token     .inspect} but received #{response['token'].inspect}." unless token      == response['token']
			
			case response['status']
			when 'ok'
				true
			when 'invalid'
				false
			else
				raise "Unknown status #{response['status'].inspect}."
			end
		end
	end
end
