require_relative 'base'
require_relative 'player_house_element'

module ClashOfClansApi
	module Models
		class PlayerHouse < Base
			property :elements, 'elements', type: PlayerHouseElement, expected: true
		end
	end
end
