require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanWarLeagueRound < Base
			property :war_tags, 'warTags', expected: true

			def prepared?
				war_tags.all? do |war_tag|
					war_tag != '#0'
				end
			end
		end
	end
end
