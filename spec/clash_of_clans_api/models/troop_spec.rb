require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Troop do
	let(:minimal_data) do
		{
			'name'     => 'Barbarian',
			'level'    => 10,
			'maxLevel' => 10,
			'village'  => 'home',
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Troop.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Troop.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::Troop
end
