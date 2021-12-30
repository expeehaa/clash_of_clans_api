require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Achievement do
	let(:instance) do
		ClashOfClansApi::Models::Achievement.new({
			'name'           => 'Bigger Coffers',
			'stars'          => 1,
			'value'          => 3,
			'target'         => 5,
			'info'           => 'Upgrade a Gold Storage to level 5',
			'completionInfo' => 'Highest Gold Storage level: 3',
			'village'        => 'home',
		}, 5)
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::Achievement.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Achievement.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Achievement.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "name", "stars", "value", "target", "info", "completionInfo", "village"'
			expect{instance                                       }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'Bigger Coffers'
		end
	end
	
	describe '#stars' do
		it 'returns the value of key "stars"' do
			expect(instance.stars).to eq 1
		end
	end
	
	describe '#value' do
		it 'returns the value of key "value"' do
			expect(instance.value).to eq 3
		end
	end
	
	describe '#target' do
		it 'returns the value of key "target"' do
			expect(instance.target).to eq 5
		end
	end
	
	describe '#info' do
		it 'returns the value of key "info"' do
			expect(instance.info).to eq 'Upgrade a Gold Storage to level 5'
		end
	end
	
	describe '#completion_info' do
		it 'returns the value of key "completionInfo"' do
			expect(instance.completion_info).to eq 'Highest Gold Storage level: 3'
		end
	end
	
	describe '#village' do
		it 'returns the value of key "village"' do
			expect(instance.village).to eq 'home'
		end
	end
end
