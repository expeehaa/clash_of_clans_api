require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::IconSet do
	let(:minimal_data) { {} }
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::IconSet.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::IconSet.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::IconSet
end
