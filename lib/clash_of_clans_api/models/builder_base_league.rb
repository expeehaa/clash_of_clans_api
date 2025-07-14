require_relative 'base'

module ClashOfClansApi
	module Models
		class BuilderBaseLeague < Base
			property :id,   'id',   expected: true
			property :name, 'name', expected: true
		end
	end
end
