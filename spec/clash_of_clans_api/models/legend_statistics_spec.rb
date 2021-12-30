require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::LegendStatistics do
	let(:instance) do
		ClashOfClansApi::Models::LegendStatistics.new({
			'legendTrophies' => 12525,
			'previousSeason' => {
				'id'       => '2021-12',
				'rank'     => 13788,
				'trophies' => 5620,
			},
			'bestSeason'     => {
				'id'       => '2021-12',
				'rank'     => 13788,
				'trophies' => 5620,
			},
			'currentSeason'  => {
				'rank'     => 291,
				'trophies' => 4988,
			},
		}, 5)
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::LegendStatistics.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::LegendStatistics.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::LegendStatistics.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "legendTrophies", "previousSeason", "bestSeason", "currentSeason"'
			expect{instance                                            }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#legend_trophies' do
		it 'returns the value of key "legendTrophies"' do
			expect(instance.legend_trophies).to eq 12525
		end
	end
	
	describe '#previous_season' do
		it 'returns the value of key "previousSeason"' do
			expect(instance.previous_season).to be_a Hash
		end
	end
	
	describe '#best_season' do
		it 'returns the value of key "bestSeason"' do
			expect(instance.best_season).to be_a Hash
		end
	end
	
	describe '#current_season' do
		it 'returns the value of key "currentSeason"' do
			expect(instance.current_season).to be_a Hash
		end
	end
end
