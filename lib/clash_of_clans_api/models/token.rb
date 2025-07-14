require_relative 'base'

module ClashOfClansApi
	module Models
		class Token < Base
			property :id,           'id',          expected: true
			property :developer_id, 'developerId'
			property :tier,         'tier'
			property :name,         'name',        expected: true
			property :description,  'description', expected: true
			property :origins,      'origins'
			property :scopes,       'scopes'
			property :cidr_ranges,  'cidrRanges',  expected: true
			property :valid_until,  'validUntil'
			property :key,          'key',         expected: true
			
			def revoke
				self.client.revoke_api_key(self.id)
			end
			
			def client_from_token
				ClashOfClansApi::Client.new(self.key)
			end
		end
	end
end
