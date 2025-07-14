require_relative 'base'

module ClashOfClansApi
	module Models
		class HeroEquipment < Base
			property :name,      'name',     expected: true
			property :level,     'level',    expected: true
			property :max_level, 'maxLevel', expected: true
			property :village,   'village',  expected: true
		end
	end
end
