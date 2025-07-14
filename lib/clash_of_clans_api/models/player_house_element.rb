require_relative 'base'

module ClashOfClansApi
	module Models
		class PlayerHouseElement < Base
			property :type, 'type', expected: true
			property :id,   'id',   expected: true
		end
	end
end
