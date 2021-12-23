module ClashOfClansApi
	module Utils
		def self.url_escape(string)
			if !string.nil?
				CGI.escape(string.to_s)
			else
				raise TypeError, 'cannot escape nil'
			end
		end
	end
end
