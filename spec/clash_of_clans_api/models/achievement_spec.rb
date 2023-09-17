require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Achievement do
	let(:minimal_data) do
		{
			'name'           => 'Bigger Coffers',
			'stars'          => 1,
			'value'          => 3,
			'target'         => 5,
			'info'           => 'Upgrade a Gold Storage to level 5',
			'completionInfo' => 'Highest Gold Storage level: 3',
			'village'        => 'home',
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Achievement.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Achievement.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Achievement.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "name", "stars", "value", "target", "info", "completionInfo", "village"'
			expect{ClashOfClansApi::Models::Achievement.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
