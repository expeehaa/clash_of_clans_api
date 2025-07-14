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
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::LegendStatistics
end
