require 'cgi'
require 'json'
require 'net/https'

require_relative 'no_success_error'

module ClashOfClansApi
	class Api
		BASE_URI = URI('https://api.clashofclans.com/v1/')
		
		attr_reader :api_token
		
		def initialize(api_token)
			@api_token = api_token
		end
		
		def endpoint_headers
			{
				'Authorization' => "Bearer #{api_token}",
			}
		end
		
		class << self
			def define_endpoint(name, method:, endpoint:, body: nil)
				case method
				when :get
					define_method(name) do |*args, **kwargs|
						uri = endpoint.respond_to?(:call) ? endpoint.call(*args, **kwargs) : endpoint
						
						transform_response(perform_get(uri, query: kwargs.dig(:query)))
					end
				when :post
					define_method(name) do |*args, **kwargs|
						uri          = endpoint.respond_to?(:call) ? endpoint.call(*args, **kwargs) : endpoint
						request_body = body.call(*args, **kwargs)
						
						transform_response(perform_post(uri, request_body, query: kwargs.dig(:query)))
					end
				else
					raise "Unsupported argument 'method: #{method.inspect}'"
				end
			end
		end
		
		def self.url_escape(string)
			if !string.nil?
				CGI.escape(string.to_s)
			else
				raise TypeError, 'cannot escape nil'
			end
		end
		
		define_endpoint :clan_currentwar_leaguegroup,     method: :get,  endpoint: proc { |clan_tag               | "clans/#{url_escape(clan_tag)}/currentwar/leaguegroup"                    }
		define_endpoint :clanwarleagues_war,              method: :get,  endpoint: proc { | war_tag               | "clanwarleagues/wars/#{url_escape(war_tag)}"                              }
		define_endpoint :clan_warlog,                     method: :get,  endpoint: proc { |clan_tag               | "clans/#{url_escape(clan_tag)}/warlog"                                    }
		define_endpoint :clans,                           method: :get,  endpoint:                                     'clans'
		define_endpoint :clan_currentwar,                 method: :get,  endpoint: proc { |clan_tag               | "clans/#{url_escape(clan_tag)}/currentwar"                                }
		define_endpoint :clan,                            method: :get,  endpoint: proc { |clan_tag               | "clans/#{url_escape(clan_tag)}"                                           }
		define_endpoint :clan_members,                    method: :get,  endpoint: proc { |clan_tag               | "clans/#{url_escape(clan_tag)}/members"                                   }
		
		define_endpoint :player,                          method: :get,  endpoint: proc { |player_tag             | "players/#{url_escape(player_tag)}"                                       }
		define_endpoint :player_verifytoken,              method: :post, endpoint: proc { |player_tag             | "players/#{url_escape(player_tag)}/verifytoken"                           }, body: proc { |token:| %Q[{"token":"#{token.to_s}"}] }
		
		define_endpoint :leagues,                         method: :get,  endpoint:                                     'leagues'
		define_endpoint :league_season,                   method: :get,  endpoint: proc { |   league_id, season_id|    "leagues/#{url_escape(   league_id)}/seasons/#{url_escape(season_id)}" }
		define_endpoint :league,                          method: :get,  endpoint: proc { |   league_id           |    "leagues/#{url_escape(   league_id)}"                                  }
		define_endpoint :league_seasons,                  method: :get,  endpoint: proc { |   league_id           |    "leagues/#{url_escape(   league_id)}/seasons"                          }
		define_endpoint :warleague,                       method: :get,  endpoint: proc { |warleague_id           | "warleagues/#{url_escape(warleague_id)}"                                  }
		define_endpoint :warleagues,                      method: :get,  endpoint:                                  'warleagues'
		
		define_endpoint :location_rankings_clans,         method: :get,  endpoint: proc { |location_id            | "locations/#{url_escape(location_id)}/rankings/clans"                     }
		define_endpoint :location_rankings_players,       method: :get,  endpoint: proc { |location_id            | "locations/#{url_escape(location_id)}/rankings/players"                   }
		define_endpoint :location_rankings_clansversus,   method: :get,  endpoint: proc { |location_id            | "locations/#{url_escape(location_id)}/rankings/clans-versus"              }
		define_endpoint :location_rankings_playersversus, method: :get,  endpoint: proc { |location_id            | "locations/#{url_escape(location_id)}/rankings/players-versus"            }
		define_endpoint :locations,                       method: :get,  endpoint:                                  'locations'
		define_endpoint :location,                        method: :get,  endpoint: proc { |location_id            | "locations/#{url_escape(location_id)}"                                    }
		
		define_endpoint :goldpass_seasons_current,        method: :get,  endpoint:                                  'goldpass/seasons/current'
		
		define_endpoint :labels_players,                  method: :get,  endpoint:                                  'labels/players'
		define_endpoint :labels_clans,                    method: :get,  endpoint:                                  'labels/clans'
		
		def perform_request(api_path, query: nil, &block)
			uri = BASE_URI+api_path
			uri.query = URI.encode_www_form(query) if query
			
			Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme=='https') do |http|
				block.call(uri).then do |request|
					endpoint_headers.each do |name, value|
						request[name] = value
					end
					
					http.request(request)
				end
			end
		end
		
		def perform_get(api_path, query: nil)
			perform_request(api_path, query: query) do |request_uri|
				Net::HTTP::Get.new(request_uri)
			end
		end
		
		def perform_post(api_path, body, query: nil)
			perform_request(api_path, query: query) do |request_uri|
				Net::HTTP::Post.new(request_uri).tap do |request|
					request['Content-Type'] = 'application/json'
					request.body            = body
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
	end
end
