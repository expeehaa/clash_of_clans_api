require 'spec_helper'

RSpec.describe ClashOfClansApi::Client do
	let(:client) { ClashOfClansApi::Client.new(ENV.fetch('CLASH_OF_CLANS_API_TOKEN', nil)) }
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Client.new        }.    to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 1)'
			expect{ClashOfClansApi::Client.new('asdf')}.not_to raise_error
		end
	end
	
	describe '#api' do
		let(:test_client) { ClashOfClansApi::Client.new('some_token') }
		
		it 'is a ClashOfClansApi::Api object' do
			expect(test_client.api          ).to be_a ClashOfClansApi::Api
			expect(test_client.api.api_token).to eq 'some_token'
		end
	end
	
	def expect_model_properties_match_object_keys(model_instance)
		expect(model_instance).to be_a(ClashOfClansApi::Models::Base).or be_a(String)
		
		if model_instance.instance_of?(ClashOfClansApi::Models::Base)
			model_instance.to_h.each_key do |key|
				expect(model_instance.class.registered_properties.keys).to include(key)
			end
			
			model_instance.class.registered_properties.each do |field_name, properties|
				case model_instance[field_name]
					when Hash
						expect_model_properties_match_object_keys(model_instance.send(properties[:method_name]))
					when Array
						model_instance.send(properties[:method_name]).each do |element|
							expect_model_properties_match_object_keys(element)
						end
					else
						if !model_instance[field_name].nil?
							if properties[:type] == DateTime
								expect(model_instance.send(properties[:method_name])).to eq DateTime.parse(model_instance[field_name])
							else
								expect(model_instance.send(properties[:method_name])).to eq model_instance[field_name]
							end
						else
							expect(model_instance.send(properties[:method_name])).to eq properties[:default]
						end
				end
			end
		end
	end
	
	[
		[:clan_currentwar_leaguegroup, ['#2LLRJ29YJ']], # TODO: Find a way to test this in a future-proof way.
		[:clanwarleagues_war,          ['#8YCQ2JGQ9']], # TODO: Find a way to test this in a future-proof way.
		[:clan_warlog,     ['#2YYQPVGQQ'       ]],
		[:clan_currentwar, ['#2YYQPVGQQ'       ]],
		[:clan,            ['#2YYQPVGQQ'       ]],
		[:clan_members,    ['#2YYQPVGQQ'       ]],
		[:player,          ['#QG8VUCRUQ'       ]],
		[:capitalleagues,  [                   ]],
		[:leagues,         [                   ]],
		[:league_season,   [29000022, '2025-03']],
		[:league,          [29000000           ]],
	].each do |method_name, arguments|
		describe "##{method_name}", vcr_cassette: method_name do
			it 'returns a model instance that implements all properties' do
				model_instance = client.send(method_name, *arguments)
				
				expect_model_properties_match_object_keys(model_instance)
			end
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
			
			expect(client.player_verifytoken('test_tag', 'asdf')).to be true
		end
		
		it 'returns false with status "invalid"' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_tag', 'token' => 'asdf', 'status' => 'invalid'})
			
			expect(client.player_verifytoken('test_tag', 'asdf')).to be false
		end
		
		it 'raises an error with any other status' do
			expect(client.api).to receive(:player_verifytoken).with('test_tag', token: 'asdf').once.and_return({'tag' => 'test_tag', 'token' => 'asdf', 'status' => 'nope'})
			
			expect{client.player_verifytoken('test_tag', 'asdf')}.to raise_error 'Unknown status "nope".'
		end
	end
end
