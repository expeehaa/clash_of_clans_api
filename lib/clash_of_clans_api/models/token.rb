require_relative 'base'

module ClashOfClansApi
	module Models
		class Token < Base
			property :id,           'id',          required: true
			property :developer_id, 'developerId'
			property :tier,         'tier'
			property :name,         'name',        required: true
			property :description,  'description', required: true
			property :origins,      'origins'
			property :scopes,       'scopes'
			property :cidr_ranges,  'cidrRanges',  required: true
			property :valid_until,  'validUntil'
			property :key,          'key',         required: true
			
			def initialize(hash, token_client:)
				super(hash)
				
				@token_client = token_client
			end
			
			def revoke
				@token_client.revoke_api_key(self.id)
			end
			
			def client_from_token
				ClashOfClansApi::Client.new(self.key)
			end
		end
	end
end
