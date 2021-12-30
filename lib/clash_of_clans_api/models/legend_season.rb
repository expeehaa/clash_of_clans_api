require_relative 'base'

module ClashOfClansApi
	module Models
		class LegendSeason < Base
			property :id,       'id',       required: false
			property :rank,     'rank',     required: true
			property :trophies, 'trophies', required: true
		end
	end
end
