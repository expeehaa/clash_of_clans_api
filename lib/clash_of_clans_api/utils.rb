require 'open-uri'

module ClashOfClansApi
	module Utils
		def self.url_escape(string)
			if !string.nil?
				CGI.escape(string.to_s)
			else
				raise TypeError, 'cannot escape nil'
			end
		end
		
		def self.call_proc_without_unknown_keywords(proc, *args, **kwargs, &block)
			params = proc.parameters.group_by(&:first).transform_values! do |m|
				m.map do |s|
					s[1]
				end
			end
			
			proc_keys =
				if params.key?(:keyrest)
					kwargs
				else
					kwargs.slice(*(params.values_at(:key, :keyreq).compact.flatten))
				end
			
			proc.call(*args, **proc_keys, &block)
		end
		
		def self.get_current_ipv4_address
			IPAddr.new(URI('https://ipv4.icanhazip.com').open.read.strip).to_s
		end
	end
end
