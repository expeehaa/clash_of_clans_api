require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Troop do
	let(:instance) do
		ClashOfClansApi::Models::Troop.new({
			'name'     => 'Barbarian',
			'level'    => 10,
			'maxLevel' => 10,
			'village'  => 'home',
		}, 5)
	end
	let(:instance_with_supertroop_active) do
		ClashOfClansApi::Models::Troop.new({
			'name'               => 'Barbarian',
			'level'              => 10,
			'maxLevel'           => 10,
			'village'            => 'home',
			'superTroopIsActive' => true,
		}, 5)
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::Troop.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Troop.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Troop.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "name", "level", "maxLevel", "village"'
			expect{instance                                 }.not_to raise_error
			expect{instance_with_supertroop_active          }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'Barbarian'
		end
	end
	
	describe '#level' do
		it 'returns the value of key "level"' do
			expect(instance.level).to eq 10
		end
	end
	
	describe '#max_level' do
		it 'returns the value of key "maxLevel"' do
			expect(instance.max_level).to eq 10
		end
	end
	
	describe '#village' do
		it 'returns the value of key "village"' do
			expect(instance.village).to eq 'home'
		end
	end
	
	describe '#super_troop_is_active' do
		it 'returns the default value "false"' do
			expect(instance.instance_variable_get(:@hash).key?('superTroopIsActive')).to eq false
			expect(instance.super_troop_is_active                                   ).to eq false
		end
		
		it 'returns the value of key "superTroopIsActive"' do
			expect(instance_with_supertroop_active.super_troop_is_active).to eq true
		end
	end
end
