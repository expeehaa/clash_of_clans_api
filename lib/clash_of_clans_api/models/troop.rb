require_relative 'base'

module ClashOfClansApi
	module Models
		class Troop < Base
			property :name,                  'name',               expected: true
			property :level,                 'level',              expected: true
			property :max_level,             'maxLevel',           expected: true
			property :village,               'village',            expected: true
			property :super_troop_is_active, 'superTroopIsActive', expected: false, default: false
		end
	end
end
