require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Clan do
	let(:instance) do
		ClashOfClansApi::Models::Clan.new({
			'tag'       => '#2YYQPVGQQ',
			'name'      => 'ClashOfClansApi',
			'clanLevel' => 1,
			'badgeUrls' => {
				'small'  => 'https://api-assets.clashofclans.com/badges/70/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				'large'  => 'https://api-assets.clashofclans.com/badges/512/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				'medium' => 'https://api-assets.clashofclans.com/badges/200/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
			},
		}, 5)
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::Clan.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Clan.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Clan.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "tag", "name", "clanLevel", "badgeUrls"'
			expect{instance                                }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#tag' do
		it 'returns the value of key "tag"' do
			expect(instance.tag).to eq '#2YYQPVGQQ'
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'ClashOfClansApi'
		end
	end
	
	describe '#clan_level' do
		it 'returns the value of key "clanLevel"' do
			expect(instance.clan_level).to eq 1
		end
	end
	
	describe '#badge_urls' do
		it 'returns the value of key "badgeUrls"' do
			expect(instance.badge_urls).to be_a ClashOfClansApi::Models::IconSet
		end
	end
end
