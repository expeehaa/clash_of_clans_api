require_relative 'base'

module ClashOfClansApi
	module Models
		class LegendSeason < Base
			property :id,       'id',       expected: false
			property :rank,     'rank',     expected: true
			property :trophies, 'trophies', expected: true
		end
	end
end
