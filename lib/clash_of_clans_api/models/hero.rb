require_relative 'base'
require_relative 'hero_equipment'

module ClashOfClansApi
	module Models
		class Hero < Base
			property :name,      'name',     expected: true
			property :level,     'level',    expected: true
			property :max_level, 'maxLevel', expected: true
			property :village,   'village',  expected: true
			property :equipment, 'equipment', type: HeroEquipment
		end
	end
end
