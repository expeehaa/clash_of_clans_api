require_relative 'invalid_data_error'

module ClashOfClansApi
	module Models
		class Base
			attr_reader :client
			
			def initialize(hash, client)
				@hash   = hash
				@client = client
				
				validate!
			end
			
			def to_h
				@hash
			end
			
			def [](key)
				@hash[key]
			end
			
			class << self
				def registered_properties
					@registered_properties ||= {}
				end
				
				def property(name, key, type: nil, required: false, default: nil)
					define_method(name) do
						deduced_type =
							case type
								when Symbol
									send(type)
								when String
									self.class.const_get(type)
								else
									type
							end
						
						if !@hash.key?(key)
							default
						elsif deduced_type.nil?
							self[key]
						elsif property_cached?(name)
							property_from_cache(name)
						else
							initializer_proc = proc do |item|
								if deduced_type.ancestors.include?(ClashOfClansApi::Models::Base)
									deduced_type.new(item, self.client)
								else
									deduced_type.new(item)
								end
							end
							
							cache_property(name, self[key].then do |prop|
								prop.is_a?(Array) ? prop.map(&initializer_proc) : initializer_proc.call(prop)
							end)
						end
					end
					
					registered_properties[key] = {
						name:     name,
						required: required,
						default:  default,
					}
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
				missing = self.class.registered_properties.reject do |field_name, properties|
					!properties[:required] || @hash.key?(field_name)
				end
				
				if missing.any?
					raise InvalidDataError, "The following keys are required, but missing from the model data: #{missing.keys.map(&:inspect).join(', ')}"
				end
			end
		end
	end
end
