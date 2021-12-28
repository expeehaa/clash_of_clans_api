require_relative 'api'
require_relative 'models/paginated_response'
require_relative 'models/player'
require_relative 'models/league'

module ClashOfClansApi
	class Client
		attr_reader :api
		
		def initialize(api_token)
			@api = Api.new(api_token)
		end
		
		def authorized?
			api.perform_request(:get, 'test').code == '404'
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
		
		def leagues
			Models::PaginatedResponse.new(Models::League, api.leagues)
		end
		
		def league(id)
			Models::League.new(api.league(id))
		end
		
		def player(tag)
			Models::Player.new(api.player(tag))
		end
		
		def league_season(league_id=29000022, season_id, limit: nil, before: nil, after: nil) # rubocop:disable Style/OptionalArguments
			Models::PaginatedResponse.new(Models::Player, api.league_season(league_id, season_id, query: {limit: limit, before: before, after: after}.compact))
		end
	end
end
