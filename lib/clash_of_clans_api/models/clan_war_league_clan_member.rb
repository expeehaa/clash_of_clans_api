require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanWarLeagueClanMember < Base
			property :tag,             'tag',           expected: true
			property :name,            'name',          expected: true
			property :town_hall_level, 'townHallLevel', expected: true
		end
	end
end
