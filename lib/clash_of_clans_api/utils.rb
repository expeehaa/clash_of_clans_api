require 'open-uri'

module ClashOfClansApi
	module Utils
		def self.current_ipv4_address
			IPAddr.new(URI('https://ipv4.icanhazip.com').open.read.strip).to_s
		end
	end
end
