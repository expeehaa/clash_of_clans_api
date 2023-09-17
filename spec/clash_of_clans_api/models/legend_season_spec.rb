require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::LegendSeason do
	let(:minimal_data) do
		{
			'rank'     => 13788,
			'trophies' => 5620,
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::LegendSeason.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::LegendSeason.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::LegendSeason.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "rank", "trophies"'
			expect{ClashOfClansApi::Models::LegendSeason.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
