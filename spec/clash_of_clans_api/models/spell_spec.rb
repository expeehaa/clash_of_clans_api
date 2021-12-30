require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Spell do
	let(:instance) do
		ClashOfClansApi::Models::Spell.new({
			'name'     => 'Invisibility Spell',
			'level'    => 3,
			'maxLevel' => 4,
			'village'  => 'home',
		}, 5)
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::Spell.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Spell.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Spell.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "name", "level", "maxLevel", "village"'
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
			expect(instance.name).to eq 'Invisibility Spell'
		end
	end
	
	describe '#level' do
		it 'returns the value of key "level"' do
			expect(instance.level).to eq 3
		end
	end
	
	describe '#max_level' do
		it 'returns the value of key "maxLevel"' do
			expect(instance.max_level).to eq 4
		end
	end
	
	describe '#village' do
		it 'returns the value of key "village"' do
			expect(instance.village).to eq 'home'
		end
	end
end
