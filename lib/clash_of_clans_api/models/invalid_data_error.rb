module ClashOfClansApi
	module Models
		class InvalidDataError < StandardError
			attr_reader :data_hash
			
			def initialize(message, data_hash=nil)
				super(message)
				
				@data_hash = data_hash
			end
		end
	end
end
