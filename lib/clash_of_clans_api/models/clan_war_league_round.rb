require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanWarLeagueRound < Base
			property :war_tags, 'warTags', required: true
		end
	end
end
