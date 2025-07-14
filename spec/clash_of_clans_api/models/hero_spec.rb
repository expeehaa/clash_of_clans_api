require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Hero do
	let(:minimal_data) do
		{
			'name'     => 'Barbarian King',
			'level'    => 78,
			'maxLevel' => 80,
			'village'  => 'home',
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Hero.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Hero.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::Hero
end
