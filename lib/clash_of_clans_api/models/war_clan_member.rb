require_relative 'base'
require_relative 'war_attack'

module ClashOfClansApi
	module Models
		class WarClanMember < Base
			property :tag,                  'tag',  expected: true
			property :name,                 'name', expected: true
			property :townhall_level,       'townhallLevel'
			property :map_position,         'mapPosition'
			property :attacks,              'attacks',            type: WarAttack
			property :opponent_attacks,     'opponentAttacks'
			property :best_opponent_attack, 'bestOpponentAttack', type: WarAttack
		end
	end
end
