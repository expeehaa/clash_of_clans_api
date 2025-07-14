require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanCapitalDistrict < Base
			property :id,                  'id',                expected: true
			property :name,                'name',              expected: true
			property :district_hall_level, 'districtHallLevel', expected: true
		end
	end
end
