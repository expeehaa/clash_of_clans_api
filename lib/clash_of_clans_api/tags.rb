module ClashOfClansApi
	module Tags
		def self.tag_regex
			/\A#[PYLQGRJCUV0289]+\z/
		end
		
		def self.sanitizable_tag_regex
			/\A\s*#?[PYLQGRJCUVO0289]+\s*\z/i
		end
		
		def self.sanitizable?(tag)
			sanitizable_tag_regex.match?(tag)
		end
		
		def self.sanitize(tag)
			tag.strip.upcase.gsub('O', '0').then do |t|
				t.start_with?('#') ? t : "##{t}"
			end
		end
	end
end
