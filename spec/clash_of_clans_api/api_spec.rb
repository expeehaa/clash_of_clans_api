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
	
	[
		[:clan_currentwar_leaguegroup,          nil,                   ['aninvalidvalue'                       ]             ],
		[:clanwarleagues_war,                   nil,                   ['aninvalidvalue'                       ]             ],
		[:clan_warlog,                          ['#2YYQPVGQQ'       ], ['aninvalidvalue'                       ]             ],
		[:clan_currentwar,                      ['#2YYQPVGQQ'       ], ['aninvalidvalue'                       ]             ],
		[:clan,                                 ['#2YYQPVGQQ'       ], ['aninvalidvalue'                       ]             ],
		[:clan_members,                         ['#2YYQPVGQQ'       ], ['aninvalidvalue'                       ]             ],
		[:clan_capitalraidseasons,              ['#2YYQPVGQQ'       ], ['aninvalidvalue'                       ]             ],
		[:player,                               ['#QG8VUCRUQ'       ], ['aninvalidvalue'                       ]             ],
		[:capitalleagues,                       [                   ], [                                       ]             ],
		[:leagues,                              [                   ], [                                       ]             ],
		[:league_season,                        [29000022, '2023-08'], ['aninvalidvalue', 'anotherinvalidvalue'], {limit: 10}],
		[:capitalleague,                        [85000022           ], ['aninvalidvalue'                       ]             ],
		[:builderbaseleague,                    [44000041           ], ['aninvalidvalue'                       ]             ],
		[:builderbaseleagues,                   [                   ], [                                       ]             ],
		[:league,                               [29000000           ], ['aninvalidvalue'                       ]             ],
		[:league_seasons,                       [29000022           ], ['aninvalidvalue'                       ]             ], # League seasons are only available in the legendary league.
		[:warleague,                            [48000000           ], ['aninvalidvalue'                       ]             ],
		[:warleagues,                           [                   ], [                                       ]             ],
		[:location_rankings_clans,              [32000094           ], ['aninvalidvalue'                       ]             ],
		[:location_rankings_players,            [32000094           ], ['aninvalidvalue'                       ]             ],
		[:location_rankings_playersbuilderbase, [32000094           ], ['aninvalidvalue'                       ]             ],
		[:location_rankings_clansbuilderbase,   [32000094           ], ['aninvalidvalue'                       ]             ],
		[:locations,                            [                   ], [                                       ]             ],
		[:location_rankings_capitals,           [32000094           ], ['aninvalidvalue'                       ]             ],
		[:location,                             [32000000           ], ['aninvalidvalue'                       ]             ],
		[:goldpass_seasons_current,             [                   ], [                                       ]             ],
		[:labels_players,                       [                   ], [                                       ]             ],
		[:labels_clans,                         [                   ], [                                       ]             ],
	].each do |method_name, valid_arguments, invalid_arguments, query|
		describe "##{method_name}", vcr_cassette: method_name do
			it 'accepts query parameters' do
				allow(api).to receive(:perform_request        ).once.with(any_args, query: {test: 5, asdf: 'i like trains'}, headers: nil, body: nil).and_return(success_response)
				allow(api).to receive(:default_response_parser).and_return(donkey_transformer)
				
				expect(api.send(method_name, ['some_test_string'] * invalid_arguments.size, query: {test: 5, asdf: 'i like trains'})).to eq 'flying cows'
			end
			
			if invalid_arguments.any?
				it 'raises an error with an invalid argument' do
					expect{api.send(method_name, *invalid_arguments, query: query)}.to raise_error do |error|
						expect(error         ).to be_a ApiFrame::NoSuccessError
						expect(error.response).to be_a(Net::HTTPNotFound).or be_a(Net::HTTPBadRequest)
					end
				end
			end
			
			it 'returns a Hash with a valid argument' do
				pending "Replace nil with an array of valid arguments for method #{method_name}!" if valid_arguments.nil?
				
				response = api.send(method_name, *valid_arguments, query: query)
				
				expect(response     ).    to be_a Hash
				expect(response.keys).not_to be_empty
			end
		end
	end
	
	describe '#clans' do
		it 'returns a hash', vcr_cassette: :clans do
			response = api.clans(query: {name: 'ClashOfClansApi'})
			
			expect(response).to be_a Hash
		end
	end
	
	describe '#player_verifytoken', vcr_cassette: :player_verifytoken do
		it 'requires two arguments' do
			expect{api.player_verifytoken           }.to raise_error TypeError,     'cannot escape nil'
			expect{api.player_verifytoken('faketag')}.to raise_error ArgumentError, 'missing keyword: :token'
		end
		
		it 'raises an error with an invalid argument' do
			expect{api.player_verifytoken('aninvalidvalue', token: 'faketoken')}.to raise_error do |error|
				expect(error         ).to be_a ApiFrame::NoSuccessError
				expect(error.response).to be_a Net::HTTPNotFound
			end
		end
		
		it 'returns a Hash with a valid argument' do
			expect(api.player_verifytoken('#QG8VUCRUQ', token: 'faketoken')).to eq({'tag' => '#QG8VUCRUQ', 'token' => 'faketoken', 'status' => 'invalid'})
		end
	end
end
