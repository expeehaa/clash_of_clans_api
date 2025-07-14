require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::League do
	let(:minimal_data) do
		{
			'id'       => 123,
			'name'     => 'Test rank',
			'iconUrls' => {
				'tiny' => 'https://api-assets.clashofclans.com/leagues/72/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png',
			},
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::League.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::League.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::League
end
