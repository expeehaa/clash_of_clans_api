require_relative 'base'

module ClashOfClansApi
	module Models
		class WarLeague < Base
			property :id,   'id',   required: true
			property :name, 'name', required: true
		end
	end
end
