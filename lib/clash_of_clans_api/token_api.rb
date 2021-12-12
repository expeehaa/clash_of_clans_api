require_relative 'endpoint_methods'

module ClashOfClansApi
	module TokenApi
		BASE_URI = URI('https://developer.clashofclans.com/api/')
		
		class << self
			include EndpointMethods
			
			def base_uri
				BASE_URI
			end
			
			define_endpoint :login,         method: :post, endpoint: 'login',         body: proc { |email:, password:|
				{
					email:    email.to_s,
					password: password.to_s,
				}.to_json
			}
			define_endpoint :logout,        method: :post, endpoint: 'logout',        body: proc { '{}' }
			define_endpoint :apikey_list,   method: :post, endpoint: 'apikey/list',   body: proc { '{}' }
			define_endpoint :apikey_create, method: :post, endpoint: 'apikey/create', body: proc { |name:, description:, ip_addresses:|
				{
					name:        name,
					description: description,
					cidrRanges:  ip_addresses,
					scopes:      [:clash],
				}.to_json
			}
			define_endpoint :apikey_revoke, method: :post, endpoint: 'apikey/revoke', body: proc { |id:|
				{
					id: id,
				}.to_json
			}
		end
	end
end
