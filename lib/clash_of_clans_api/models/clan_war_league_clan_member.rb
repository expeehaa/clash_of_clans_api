require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanWarLeagueClanMember < Base
			property :tag,            'tag',           required: true
			property :name,           'name',          required: true
			property :town_hall_level, 'townHallLevel', required: true
		end
	end
end
