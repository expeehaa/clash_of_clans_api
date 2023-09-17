require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Token do
	let(:token_client) { double }
	let(:instance    ) do
		ClashOfClansApi::Models::Token.new({
			'id'          => 'abcdefg',
			'developerId' => 'testdev',
			'tier'        => 'platinum',
			'name'        => 'testname',
			'description' => 'test description',
			'origins'     => 'none',
			'scopes'      => ['clash'],
			'cidrRanges'  => ['1.1.1.1', '5.5.5.5'],
			'validUntil'  => 'it is invalid',
			'key'         => 'mysupercoolkey',
		}, token_client)
	end
	
	describe '.new' do
		it 'requires two arguments' do
			expect{ClashOfClansApi::Models::Token.new    }.    to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Token.new({})}.    to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Token.new({}, nil)}.to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "id", "name", "description", "cidrRanges", "key"'
		end
	end
	
	describe '#id' do
		it 'returns the value of key "id"' do
			expect(instance.id).to eq 'abcdefg'
		end
	end
	
	describe '#developer_id' do
		it 'returns the value of key "developerId"' do
			expect(instance.developer_id).to eq 'testdev'
		end
	end
	
	describe '#tier' do
		it 'returns the value of key "tier"' do
			expect(instance.tier).to eq 'platinum'
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'testname'
		end
	end
	
	describe '#description' do
		it 'returns the value of key "description"' do
			expect(instance.description).to eq 'test description'
		end
	end
	
	describe '#origins' do
		it 'returns the value of key "origins"' do
			expect(instance.origins).to eq 'none'
		end
	end
	
	describe '#scopes' do
		it 'returns the value of key "scopes"' do
			expect(instance.scopes).to eq ['clash']
		end
	end
	
	describe '#cidr_ranges' do
		it 'returns the value of key "cidrRanges"' do
			expect(instance.cidr_ranges).to eq ['1.1.1.1', '5.5.5.5']
		end
	end
	
	describe '#valid_until' do
		it 'returns the value of key "validUntil"' do
			expect(instance.valid_until).to eq 'it is invalid'
		end
	end
	
	describe '#key' do
		it 'returns the value of key "key"' do
			expect(instance.key).to eq 'mysupercoolkey'
		end
	end
	
	describe '#revoke' do
		it 'calls #revoke_api_key on the token_client' do
			expect(token_client).to receive(:revoke_api_key).with('abcdefg').and_return(5)
			
			instance.revoke
		end
	end
	
	describe '#client_from_token' do
		it 'creates a new ClashOfClansApi::Client instance using the token key' do
			client = instance.client_from_token
			
			expect(client              ).to be_a(ClashOfClansApi::Client)
			expect(client.api.api_token).to eq 'mysupercoolkey'
		end
	end
end
