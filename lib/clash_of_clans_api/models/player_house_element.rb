require_relative 'base'

module ClashOfClansApi
	module Models
		class PlayerHouseElement < Base
			property :type, 'type', required: true
			property :id,   'id',   required: true
		end
	end
end
