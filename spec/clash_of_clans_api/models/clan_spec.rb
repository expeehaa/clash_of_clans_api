require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Clan do
	let(:minimal_data) do
		{
			'tag'       => '#2YYQPVGQQ',
			'name'      => 'ClashOfClansApi',
			'badgeUrls' => {
				'small'  => 'https://api-assets.clashofclans.com/badges/70/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				'large'  => 'https://api-assets.clashofclans.com/badges/512/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				'medium' => 'https://api-assets.clashofclans.com/badges/200/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
			},
			'clanLevel' => 1,
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Clan.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Clan.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Clan.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "tag", "name", "clanLevel", "badgeUrls"'
			expect{ClashOfClansApi::Models::Clan.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
