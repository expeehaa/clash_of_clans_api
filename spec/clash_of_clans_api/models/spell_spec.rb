require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Spell do
	let(:minimal_data) do
		{
			'name'     => 'Invisibility Spell',
			'level'    => 3,
			'maxLevel' => 4,
			'village'  => 'home',
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Spell.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Spell.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::Spell
end
