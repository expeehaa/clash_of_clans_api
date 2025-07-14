require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Player do
	let(:minimal_data) do
		{
			'tag'  => '#QG8VUCRUQ',
			'name' => 'ClashOfClansApi',
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Player.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Player.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::Player
end
