require_relative 'base'
require_relative 'player_house_element'

module ClashOfClansApi
	module Models
		class PlayerHouse < Base
			property :elements, 'elements', type: PlayerHouseElement, required: true
		end
	end
end
