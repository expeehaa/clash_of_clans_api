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
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Player.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "tag", "name"'
			expect{ClashOfClansApi::Models::Player.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
