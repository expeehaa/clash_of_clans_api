require_relative 'base'
require_relative 'legend_season'

module ClashOfClansApi
	module Models
		class LegendStatistics < Base
			property :legend_trophies, 'legendTrophies', required: true
			property :previous_season, 'previousSeason', required: true, type: LegendSeason
			property :best_season,     'bestSeason',     required: true, type: LegendSeason
			property :current_season,  'currentSeason',  required: true, type: LegendSeason
		end
	end
end
