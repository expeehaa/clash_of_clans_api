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
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::League.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "id", "name", "iconUrls"'
			expect{ClashOfClansApi::Models::League.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
