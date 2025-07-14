require_relative 'base'

module ClashOfClansApi
	module Models
		class WarAttack < Base
			property :attacker_tag,           'attackerTag',           expected: true
			property :defender_tag,           'defenderTag',           expected: true
			property :stars,                  'stars',                 expected: true
			property :destruction_percentage, 'destructionPercentage', expected: true
			property :order,                  'order',                 expected: true
			property :duration,               'duration',              expected: true
		end
	end
end
