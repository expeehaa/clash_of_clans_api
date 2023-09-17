require_relative 'base'
require_relative 'pagination_paging'

module ClashOfClansApi
	module Models
		class PaginatedResponse < Base
			attr_accessor :item_type
			
			property :items,  'items',  required: true, type: :item_type
			property :paging, 'paging', required: true, type: PaginationPaging
			
			def initialize(item_type, hash, client)
				self.item_type = item_type
				
				super(hash, client)
			end
		end
	end
end
