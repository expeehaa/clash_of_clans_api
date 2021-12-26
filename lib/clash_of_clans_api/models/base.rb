require_relative 'invalid_data_error'

module ClashOfClansApi
	module Models
		class Base
			def initialize(hash)
				@hash = hash
				
				validate!
			end
			
			def to_h
				@hash
			end
			
			def [](key)
				@hash[key]
			end
			
			class << self
				attr_reader :required_fields
				
				def property(name, key, type: nil, required: false)
					define_method(name) do
						if type.nil?
							self[key]
						else
							if property_cached?(name)
								property_from_cache(name)
							else
								cache_property(name, self[key].then do |prop|
									prop.is_a?(Array) ? prop.map {|item| type.new(item) } : type.new(prop)
								end)
							end
						end
					end
					
					if required
						@required_fields = (@required_fields || []) + [key]
					end
				end
			end
			
			def property_cached?(name)
				@property_cache && @property_cache.key?(name)
			end
			
			def cache_property(name, obj)
				@property_cache ||= {}
				
				@property_cache[name] = obj
			end
			
			def property_from_cache(name)
				@property_cache[name]
			end
			
			def validate!
				if self.class.required_fields
					missing = self.class.required_fields.reject do |required_field|
						@hash.key?(required_field)
					end
					
					if missing.any?
						raise InvalidDataError, "The following keys are required, but missing from the model data: #{missing.map(&:inspect).join(', ')}"
					end
				end
			end
		end
	end
end
