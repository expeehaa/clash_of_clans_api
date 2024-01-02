require_relative 'base'
require_relative 'clan_war_league_clan'
require_relative 'clan_war_league_round'

module ClashOfClansApi
	module Models
		class ClanWarLeagueGroup < Base
			property :state,  'state',  required: true
			property :season, 'season', required: true
			property :clans,  'clans',  required: true, type: ClanWarLeagueClan
			property :rounds, 'rounds', required: true, type: ClanWarLeagueRound
		end
	end
end
