require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Clan do
	let(:minimal_data) do
		{
			'tag'  => '#2YYQPVGQQ',
			'name' => 'ClashOfClansApi',
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Clan.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Clan.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	include_examples 'model has expected', ClashOfClansApi::Models::Clan
end
