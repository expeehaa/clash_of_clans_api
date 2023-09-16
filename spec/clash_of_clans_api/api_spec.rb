require 'spec_helper'

RSpec.describe ClashOfClansApi::Api do
	let(:api) { ClashOfClansApi::Api.new(ENV.fetch('CLASH_OF_CLANS_API_TOKEN', nil)) }
	let(:success_response) do
		Class.new do
			def body
				'flying donkeys'
			end
			
			def is_a?(klass)
				if klass == Net::HTTPSuccess
					true
				else
					raise "Expected Net::HTTPSuccess, got #{klass.inspect}."
				end
			end
		end.new
	end
	let(:donkey_transformer) do
		proc do |response|
			expect(response.body).to eq 'flying donkeys'
			
			'flying cows'
		end
	end
	
	before do |example|
		if example.metadata[:coc_api_request] && (!ENV['CLASH_OF_CLANS_API_TOKEN'] || ENV['CLASH_OF_CLANS_API_TOKEN'].empty?)
			pending
		end
	end
	
	[
		[:clan_currentwar_leaguegroup,          nil,          'aninvalidvalue'],
		[:clanwarleagues_war,                   nil,          'aninvalidvalue'],
		[:clan_warlog,                          '#2YYQPVGQQ', 'aninvalidvalue'],
		[:clan_currentwar,                      '#2YYQPVGQQ', 'aninvalidvalue'],
		[:clan,                                 '#2YYQPVGQQ', 'aninvalidvalue'],
		[:clan_members,                         '#2YYQPVGQQ', 'aninvalidvalue'],
		[:clan_capitalraidseasons,              '#2YYQPVGQQ', 'aninvalidvalue'],
		[:player,                               '#QG8VUCRUQ', 'aninvalidvalue'],
		[:capitalleague,                        85000022,     'aninvalidvalue'],
		[:league,                               29000000,     'aninvalidvalue'],
		[:league_seasons,                       29000022,     'aninvalidvalue'], # League seasons are only available in the legendary league.
		[:builderbaseleague,                    44000041,     'aninvalidvalue'],
		[:warleague,                            48000000,     'aninvalidvalue'],
		[:location_rankings_clans,              32000094,     'aninvalidvalue'],
		[:location_rankings_players,            32000094,     'aninvalidvalue'],
		[:location_rankings_clansversus,        32000094,     'aninvalidvalue'],
		[:location_rankings_playersbuilderbase, 32000094,     'aninvalidvalue'],
		[:location_rankings_clansbuilderbase,   32000094,     'aninvalidvalue'],
		[:location_rankings_playersversus,      32000094,     'aninvalidvalue'],
		[:location_rankings_capitals,           32000094,     'aninvalidvalue'],
		[:location,                             32000000,     'aninvalidvalue'],
	].each do |method_name, argument, invalid_argument|
		describe "##{method_name}" do
			it 'requires one argument' do
				expect{api.send(method_name)}.to raise_error TypeError, 'cannot escape nil'
			end
			
			it 'accepts query parameters' do
				allow(api).to receive(:perform_request        ).once.with(any_args, query: {test: 5, asdf: 'i like trains'}, headers: nil, body: nil).and_return(success_response)
				allow(api).to receive(:default_response_parser).and_return(donkey_transformer)
				
				expect(api.send(method_name, 'some_test_string', query: {test: 5, asdf: 'i like trains'})).to eq 'flying cows'
			end
			
			it 'raises an error with an invalid argument', coc_api_request: true do
				expect{api.send(method_name, invalid_argument)}.to raise_error do |error|
					expect(error         ).to be_a ApiFrame::NoSuccessError
					expect(error.response).to be_a(Net::HTTPNotFound).or be_a(Net::HTTPBadRequest)
				end
			end
			
			if !argument.nil?
				it 'returns a Hash with a valid argument', coc_api_request: true do
					response = api.send(method_name, argument)
					
					expect(response     ).    to be_a Hash
					expect(response.keys).not_to be_empty
				end
			end
		end
	end
	
	[
		:capitalleagues,
		:leagues,
		:builderbaseleagues,
		:warleagues,
		:locations,
		:goldpass_seasons_current,
		:labels_players,
		:labels_clans,
	].each do |method_name|
		describe "##{method_name}" do
			it 'returns a hash', coc_api_request: true do
				response = api.send(method_name)
				
				expect(response).to be_a Hash
			end
			
			it 'accepts query parameters' do
				allow(api).to receive(:perform_request        ).once.with(any_args, query: {test: 5, asdf: 'i like trains'}, headers: nil, body: nil).and_return(success_response)
				allow(api).to receive(:default_response_parser).and_return(donkey_transformer)
				
				expect(api.send(method_name, query: {test: 5, asdf: 'i like trains'})).to eq 'flying cows'
			end
		end
	end
	
	describe '#clans' do
		it 'returns a hash', coc_api_request: true do
			response = api.clans(query: {name: 'ClashOfClansApi'})
			
			expect(response).to be_a Hash
		end
	end
	
	describe '#player_verifytoken' do
		it 'requires two arguments' do
			expect{api.player_verifytoken           }.to raise_error TypeError,     'cannot escape nil'
			expect{api.player_verifytoken('faketag')}.to raise_error ArgumentError, 'missing keyword: :token'
		end
		
		it 'raises an error with an invalid argument', coc_api_request: true do
			expect{api.player_verifytoken('aninvalidvalue', token: 'faketoken')}.to raise_error do |error|
				expect(error         ).to be_a ApiFrame::NoSuccessError
				expect(error.response).to be_a Net::HTTPNotFound
			end
		end
		
		it 'returns a Hash with a valid argument', coc_api_request: true do
			expect(api.player_verifytoken('#QG8VUCRUQ', token: 'faketoken')).to eq({'tag' => '#QG8VUCRUQ', 'token' => 'faketoken', 'status' => 'invalid'})
		end
	end
end
