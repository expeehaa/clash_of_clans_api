require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Hero do
	let(:instance) do
		ClashOfClansApi::Models::Hero.new({
			'name'     => 'Barbarian King',
			'level'    => 78,
			'maxLevel' => 80,
			'village'  => 'home',
		}, 5)
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::Hero.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Hero.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Hero.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "name", "level", "maxLevel", "village"'
			expect{instance                                 }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'Barbarian King'
		end
	end
	
	describe '#level' do
		it 'returns the value of key "level"' do
			expect(instance.level).to eq 78
		end
	end
	
	describe '#max_level' do
		it 'returns the value of key "maxLevel"' do
			expect(instance.max_level).to eq 80
		end
	end
	
	describe '#village' do
		it 'returns the value of key "village"' do
			expect(instance.village).to eq 'home'
		end
	end
end
