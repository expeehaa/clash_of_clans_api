require_relative 'base'
require_relative 'hero_equipment'

module ClashOfClansApi
	module Models
		class Hero < Base
			property :name,      'name',     required: true
			property :level,     'level',    required: true
			property :max_level, 'maxLevel', required: true
			property :village,   'village',  required: true
			property :equipment, 'equipment', type: HeroEquipment
		end
	end
end
