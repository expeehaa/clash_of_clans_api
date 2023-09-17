require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::LegendSeason do
	let(:instance) do
		ClashOfClansApi::Models::LegendSeason.new({
			'id'       => '2021-12',
			'rank'     => 13788,
			'trophies' => 5620,
		}, 5)
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::LegendSeason.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::LegendSeason.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::LegendSeason.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "rank", "trophies"'
			expect{instance                                            }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#id' do
		it 'returns the value of key "id"' do
			expect(instance.id).to eq '2021-12'
		end
	end
	
	describe '#rank' do
		it 'returns the value of key "rank"' do
			expect(instance.rank).to eq 13788
		end
	end
	
	describe '#trophies' do
		it 'returns the value of key "trophies"' do
			expect(instance.trophies).to eq 5620
		end
	end
end
