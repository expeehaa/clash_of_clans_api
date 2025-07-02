require_relative 'base'
require_relative 'clan_war_league_clan'
require_relative 'clan_war_league_round'

module ClashOfClansApi
	module Models
		class ClanWarLeagueGroup < Base
			property :state,  'state',  required: true
			property :season, 'season'
			property :clans,  'clans', type: ClanWarLeagueClan
			property :rounds, 'rounds', type: ClanWarLeagueRound
		end
	end
end
