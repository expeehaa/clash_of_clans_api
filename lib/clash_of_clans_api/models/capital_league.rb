require_relative 'base'

module ClashOfClansApi
	module Models
		class CapitalLeague < Base
			property :id,   'id',   expected: true
			property :name, 'name', expected: true
		end
	end
end
