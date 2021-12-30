require_relative 'base'

module ClashOfClansApi
	module Models
		class Troop < Base
			property :name,                  'name',               required: true
			property :level,                 'level',              required: true
			property :max_level,             'maxLevel',           required: true
			property :village,               'village',            required: true
			property :super_troop_is_active, 'superTroopIsActive', required: false, default: false
		end
	end
end
