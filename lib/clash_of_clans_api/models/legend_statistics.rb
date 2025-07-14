require_relative 'base'
require_relative 'legend_season'

module ClashOfClansApi
	module Models
		class LegendStatistics < Base
			property :legend_trophies, 'legendTrophies', expected: true
			property :previous_season, 'previousSeason', expected: true, type: LegendSeason
			property :best_season,     'bestSeason',     expected: true, type: LegendSeason
			property :current_season,  'currentSeason',  expected: true, type: LegendSeason
		end
	end
end
