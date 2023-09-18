require_relative 'base'

module ClashOfClansApi
	module Models
		class WarAttack < Base
			property :attacker_tag,           'attackerTag',           required: true
			property :defender_tag,           'defenderTag',           required: true
			property :stars,                  'stars',                 required: true
			property :destruction_percentage, 'destructionPercentage', required: true
			property :order,                  'order',                 required: true
			property :duration,               'duration',              required: true
		end
	end
end
