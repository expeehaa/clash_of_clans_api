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
				attr_reader :required_fields
				
				def property(name, key, type: nil, required: false, default: nil)
					define_method(name) do
						type =
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
						elsif type.nil?
							self[key]
						elsif property_cached?(name)
							property_from_cache(name)
						else
							initializer_proc = proc do |item|
								if type.ancestors.include?(ClashOfClansApi::Models::Base)
									type.new(item, self.client)
								else
									type.new(item)
								end
							end
							
							cache_property(name, self[key].then do |prop|
								prop.is_a?(Array) ? prop.map(&initializer_proc) : initializer_proc.call(prop)
							end)
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
