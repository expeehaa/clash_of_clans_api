module ClashOfClansApi
	class NoSuccessError < StandardError
		attr_reader :response
		
		def initialize(response)
			super
			
			@response = response
		end
	end
end
