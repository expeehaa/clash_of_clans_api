require 'spec_helper'

RSpec.describe ClashOfClansApi::Client do
	let(:client) { ClashOfClansApi::Client.new('some_token') }
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Client.new        }.    to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 1)'
			expect{ClashOfClansApi::Client.new('asdf')}.not_to raise_error
		end
	end
	
	describe '#api' do
		it 'is a ClashOfClansApi::Api object' do
			expect(client.api          ).to be_a ClashOfClansApi::Api
			expect(client.api.api_token).to eq 'some_token'
		end
	end
	
	describe '#player_verifytoken' do
		it 'raises an error if the sent and received player tags do not match' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_ta2', 'token' => 'asdf', 'status' => 'ok'})
			
			expect{client.player_verifytoken('test_tag', 'asdf')}.to raise_error 'Sent player tag "test_tag" but received "test_ta2".'
		end
		
		it 'raises an error if the sent and received tokens do not match' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_tag', 'token' => 'asdg', 'status' => 'ok'})
			
			expect{client.player_verifytoken('test_tag', 'asdf')}.to raise_error 'Sent token "asdf" but received "asdg".'
		end
		
		it 'returns true with status "ok"' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_tag', 'token' => 'asdf', 'status' => 'ok'})
			
			expect(client.player_verifytoken('test_tag', 'asdf')).to eq true
		end
		
		it 'returns false with status "invalid"' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_tag', 'token' => 'asdf', 'status' => 'invalid'})
			
			expect(client.player_verifytoken('test_tag', 'asdf')).to eq false
		end
		
		it 'raises an error with any other status' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_tag', 'token' => 'asdf', 'status' => 'nope'})
			
			expect{client.player_verifytoken('test_tag', 'asdf')}.to raise_error 'Unknown status "nope".'
		end
	end
end
