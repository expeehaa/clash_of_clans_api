require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanLocation < Base
			property :id,       'id',        expected: true
			property :name,     'name',      expected: true
			property :country?, 'isCountry', expected: true
		end
	end
end
