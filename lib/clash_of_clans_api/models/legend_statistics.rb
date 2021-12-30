require_relative 'base'

module ClashOfClansApi
	module Models
		class LegendStatistics < Base
			property :legend_trophies, 'legendTrophies', required: true
			property :previous_season, 'previousSeason', required: true
			property :best_season,     'bestSeason',     required: true
			property :current_season,  'currentSeason',  required: true
		end
	end
end
