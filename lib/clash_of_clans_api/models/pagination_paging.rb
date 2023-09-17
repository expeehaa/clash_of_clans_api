require_relative 'base'
require_relative 'pagination_cursors'

module ClashOfClansApi
	module Models
		class PaginationPaging < Base
			property :cursors, 'cursors', required: true, type: PaginationCursors
		end
	end
end
