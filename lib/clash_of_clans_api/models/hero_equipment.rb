require_relative 'base'

module ClashOfClansApi
	module Models
		class HeroEquipment < Base
			property :name,      'name',     required: true
			property :level,     'level',    required: true
			property :max_level, 'maxLevel', required: true
			property :village,   'village',  required: true
		end
	end
end
