require 'api_frame'

require_relative 'utils'

module ClashOfClansApi
	class Api
		include ApiFrame::EndpointMethods
		
		BASE_URI = URI('https://api.clashofclans.com/v1/')
		
		def base_uri
			BASE_URI
		end
		
		attr_reader :api_token
		
		def initialize(api_token)
			@api_token = api_token
		end
		
		def default_headers
			{
				'Authorization' => "Bearer #{api_token}",
			}
		end
		
		define_endpoint :clan_currentwar_leaguegroup, method: :get, endpoint: proc { |clan_tag| "clans/#{ApiFrame::Utils.url_escape(clan_tag)}/currentwar/leaguegroup" }
		define_endpoint :clanwarleagues_war,          method: :get, endpoint: proc { | war_tag| "clanwarleagues/wars/#{ApiFrame::Utils.url_escape(war_tag)}"           }
		define_endpoint :clan_warlog,                 method: :get, endpoint: proc { |clan_tag| "clans/#{ApiFrame::Utils.url_escape(clan_tag)}/warlog"                 }
		define_endpoint :clans,                       method: :get, endpoint:                   'clans'
		define_endpoint :clan_currentwar,             method: :get, endpoint: proc { |clan_tag| "clans/#{ApiFrame::Utils.url_escape(clan_tag)}/currentwar"             }
		define_endpoint :clan,                        method: :get, endpoint: proc { |clan_tag| "clans/#{ApiFrame::Utils.url_escape(clan_tag)}"                        }
		define_endpoint :clan_members,                method: :get, endpoint: proc { |clan_tag| "clans/#{ApiFrame::Utils.url_escape(clan_tag)}/members"                }
		define_endpoint :clan_capitalraidseasons,     method: :get, endpoint: proc { |clan_tag| "clans/#{ApiFrame::Utils.url_escape(clan_tag)}/capitalraidseasons"     }
		
		define_endpoint :player,             method: :get,  endpoint: proc { |player_tag| "players/#{ApiFrame::Utils.url_escape(player_tag)}"             }
		define_endpoint :player_verifytoken, method: :post, endpoint: proc { |player_tag| "players/#{ApiFrame::Utils.url_escape(player_tag)}/verifytoken" }, body: proc { |token:| %Q({"token":"#{token}"}) }
		
		define_endpoint :capitalleagues,     method: :get, endpoint:                                               'capitalleagues'
		define_endpoint :leagues,            method: :get, endpoint:                                                      'leagues'
		define_endpoint :league_season,      method: :get, endpoint: proc { |           league_id, season_id |            "leagues/#{ApiFrame::Utils.url_escape(           league_id)}/seasons/#{ApiFrame::Utils.url_escape(season_id)}" }
		define_endpoint :capitalleague,      method: :get, endpoint: proc { |    capitalleague_id            |     "capitalleagues/#{ApiFrame::Utils.url_escape(    capitalleague_id)}"                                                  }
		define_endpoint :builderbaseleague,  method: :get, endpoint: proc { |builderbaseleague_id            | "builderbaseleagues/#{ApiFrame::Utils.url_escape(builderbaseleague_id)}"                                                  }
		define_endpoint :builderbaseleagues, method: :get, endpoint:                                           'builderbaseleagues'
		define_endpoint :league,             method: :get, endpoint: proc { |           league_id            |            "leagues/#{ApiFrame::Utils.url_escape(           league_id)}"                                                  }
		define_endpoint :league_seasons,     method: :get, endpoint: proc { |           league_id            |            "leagues/#{ApiFrame::Utils.url_escape(           league_id)}/seasons"                                          }
		define_endpoint :warleague,          method: :get, endpoint: proc { |        warleague_id            |         "warleagues/#{ApiFrame::Utils.url_escape(        warleague_id)}"                                                  }
		define_endpoint :warleagues,         method: :get, endpoint:                                                   'warleagues'
		
		define_endpoint :location_rankings_clans,              method: :get, endpoint: proc { |location_id| "locations/#{ApiFrame::Utils.url_escape(location_id)}/rankings/clans"                }
		define_endpoint :location_rankings_players,            method: :get, endpoint: proc { |location_id| "locations/#{ApiFrame::Utils.url_escape(location_id)}/rankings/players"              }
		define_endpoint :location_rankings_playersbuilderbase, method: :get, endpoint: proc { |location_id| "locations/#{ApiFrame::Utils.url_escape(location_id)}/rankings/players-builder-base" }
		define_endpoint :location_rankings_clansbuilderbase,   method: :get, endpoint: proc { |location_id| "locations/#{ApiFrame::Utils.url_escape(location_id)}/rankings/clans-builder-base"   }
		define_endpoint :locations,                            method: :get, endpoint:                      'locations'
		define_endpoint :location_rankings_capitals,           method: :get, endpoint: proc { |location_id| "locations/#{ApiFrame::Utils.url_escape(location_id)}/rankings/capitals"             }
		define_endpoint :location,                             method: :get, endpoint: proc { |location_id| "locations/#{ApiFrame::Utils.url_escape(location_id)}"                               }
		
		define_endpoint :goldpass_seasons_current, method: :get, endpoint: 'goldpass/seasons/current'
		
		define_endpoint :labels_players, method: :get, endpoint: 'labels/players'
		define_endpoint :labels_clans,   method: :get, endpoint: 'labels/clans'
	end
end
