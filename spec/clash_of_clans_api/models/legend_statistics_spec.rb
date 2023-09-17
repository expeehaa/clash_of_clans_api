require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::LegendStatistics do
	let(:minimal_data) do
		{
			'legendTrophies' => 12525,
			'previousSeason' => {
				'rank'     => 13788,
				'trophies' => 5620,
			},
			'bestSeason'     => {
				'rank'     => 13788,
				'trophies' => 5620,
			},
			'currentSeason'  => {
				'rank'     => 291,
				'trophies' => 4988,
			},
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::LegendStatistics.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::LegendStatistics.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::LegendStatistics.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "legendTrophies", "previousSeason", "bestSeason", "currentSeason"'
			expect{ClashOfClansApi::Models::LegendStatistics.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
