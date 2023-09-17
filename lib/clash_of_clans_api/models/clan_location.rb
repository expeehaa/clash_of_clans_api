require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanLocation < Base
			property :id,       'id',        required: true
			property :name,     'name',      required: true
			property :country?, 'isCountry', required: true
		end
	end
end
