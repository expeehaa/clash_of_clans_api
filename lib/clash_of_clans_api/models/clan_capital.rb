require_relative 'base'
require_relative 'clan_capital_district'

module ClashOfClansApi
	module Models
		class ClanCapital < Base
			property :capital_hall_level, 'capitalHallLevel', required: true
			property :districts,          'districts',        required: true, type: ClanCapitalDistrict
		end
	end
end
