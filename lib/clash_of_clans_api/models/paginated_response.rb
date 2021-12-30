require_relative 'base'

module ClashOfClansApi
	module Models
		class PaginatedResponse < Base
			attr_accessor :item_type
			
			property :items,  'items',  type: :item_type, required: true
			property :paging, 'paging'
			
			def initialize(item_type, hash, client)
				self.item_type = item_type
				
				super(hash, client)
			end
		end
	end
end
