require_relative 'base'
require_relative 'clan_capital_district'

module ClashOfClansApi
	module Models
		class ClanCapital < Base
			property :capital_hall_level, 'capitalHallLevel', expected: true
			property :districts,          'districts',        expected: true, type: ClanCapitalDistrict
		end
	end
end
