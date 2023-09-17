require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanCapitalDistrict < Base
			property :id,                  'id',                required: true
			property :name,                'name',              required: true
			property :district_hall_level, 'districtHallLevel', required: true
		end
	end
end
