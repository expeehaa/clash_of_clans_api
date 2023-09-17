require_relative 'base'

module ClashOfClansApi
	module Models
		class PaginationCursors < Base
			property :after,  'after'
			property :before, 'before'
		end
	end
end
