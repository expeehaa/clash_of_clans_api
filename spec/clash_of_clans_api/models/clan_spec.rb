require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Clan do
	let(:instance) do
		ClashOfClansApi::Models::Clan.new({
			'tag'                    => '#2YYQPVGQQ',
			'name'                   => 'ClashOfClansApi',
			'type'                   => 'closed',
			'description'            => 'API test clan',
			'location'               => {
				'id'        => 32000006,
				'name'      => 'International',
				'isCountry' => false,
			},
			'badgeUrls'              => {
				'small'  => 'https://api-assets.clashofclans.com/badges/70/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				'large'  => 'https://api-assets.clashofclans.com/badges/512/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				'medium' => 'https://api-assets.clashofclans.com/badges/200/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
			},
			'clanLevel'              => 1,
			'clanPoints'             => 106,
			'clanVersusPoints'       => 0,
			'requiredTrophies'       => 0,
			'warFrequency'           => 'never',
			'warWinStreak'           => 0,
			'warWins'                => 0,
			'warTies'                => 0,
			'warLosses'              => 0,
			'isWarLogPublic'         => true,
			'warLeague'              => {'id' => 48000000, 'name' => 'Unranked'},
			'members'                => 1,
			'memberList'             => [
				{
					'tag'               => '#QG8VUCRUQ',
					'name'              => 'ClashOfClansApi',
					'role'              => 'leader',
					'expLevel'          => 10,
					'league'            => {
						'id'       => 29000000,
						'name'     => 'Unranked',
						'iconUrls' => {
							'small' => 'https://api-assets.clashofclans.com/leagues/72/e--YMyIexEQQhE4imLoJcwhYn6Uy8KqlgyY3_kFV6t4.png',
							'tiny'  => 'https://api-assets.clashofclans.com/leagues/36/e--YMyIexEQQhE4imLoJcwhYn6Uy8KqlgyY3_kFV6t4.png',
						},
					},
					'trophies'          => 212,
					'versusTrophies'    => 0,
					'clanRank'          => 1,
					'previousClanRank'  => 1,
					'donations'         => 0,
					'donationsReceived' => 0,
				},
			],
			'labels'                 => [
				{
					'id'       => 56000007,
					'name'     => 'International',
					'iconUrls' => {
						'small'  => 'https://api-assets.clashofclans.com/labels/64/zyaTKuJXrsPiU3DvjgdqaSA6B1qvcQ0cjD6ktRah4xs.png',
						'medium' => 'https://api-assets.clashofclans.com/labels/128/zyaTKuJXrsPiU3DvjgdqaSA6B1qvcQ0cjD6ktRah4xs.png',
					},
				},
				{
					'id'       => 56000008,
					'name'     => 'Farming',
					'iconUrls' => {
						'small'  => 'https://api-assets.clashofclans.com/labels/64/iLWz6AiaIHg_DqfG6s9vAxUJKb-RsPbSYl_S0ii9GAM.png',
						'medium' => 'https://api-assets.clashofclans.com/labels/128/iLWz6AiaIHg_DqfG6s9vAxUJKb-RsPbSYl_S0ii9GAM.png',
					},
				},
				{
					'id'       => 56000012,
					'name'     => 'Underdog',
					'iconUrls' => {
						'small'  => 'https://api-assets.clashofclans.com/labels/64/ImSgCg88EEl80mwzFZMIiJTqa33bJmJPcl4v2eT6O04.png',
						'medium' => 'https://api-assets.clashofclans.com/labels/128/ImSgCg88EEl80mwzFZMIiJTqa33bJmJPcl4v2eT6O04.png',
					},
				},
			],
			'chatLanguage'           => {
				'id'           => 75000000,
				'name'         => 'English',
				'languageCode' => 'EN',
			},
			'requiredVersusTrophies' => 0,
			'requiredTownhallLevel'  => 1,
		}, 5)
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
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
	
	describe '#type' do
		it 'returns the value of key "type"' do
			expect(instance.type).to eq 'closed'
		end
	end
	
	describe '#location' do
		it 'returns the value of key "location"' do
			expect(instance.location).to be_a Hash
		end
	end
	
	describe '#clan_points' do
		it 'returns the value of key "clanPoints"' do
			expect(instance.clan_points).to eq 106
		end
	end
	
	describe '#clan_versus_points' do
		it 'returns the value of key "clanVersusPoints"' do
			expect(instance.clan_versus_points).to eq 0
		end
	end
	
	describe '#required_trophies' do
		it 'returns the value of key "requiredTrophies"' do
			expect(instance.required_trophies).to eq 0
		end
	end
	
	describe '#war_frequency' do
		it 'returns the value of key "warFrequency"' do
			expect(instance.war_frequency).to eq 'never'
		end
	end
	
	describe '#war_win_streak' do
		it 'returns the value of key "warWinStreak"' do
			expect(instance.war_win_streak).to eq 0
		end
	end
	
	describe '#war_wins' do
		it 'returns the value of key "warWins"' do
			expect(instance.war_wins).to eq 0
		end
	end
	
	describe '#war_ties' do
		it 'returns the value of key "warTies"' do
			expect(instance.war_ties).to eq 0
		end
	end
	
	describe '#war_losses' do
		it 'returns the value of key "warLosses"' do
			expect(instance.war_losses).to eq 0
		end
	end
	
	describe '#is_war_log_public' do
		it 'returns the value of key "isWarLogPublic"' do
			expect(instance.is_war_log_public).to be true
		end
	end
	
	describe '#war_league' do
		it 'returns the value of key "warLeague"' do
			expect(instance.war_league).to be_a Hash
		end
	end
	
	describe '#members' do
		it 'returns the value of key "members"' do
			expect(instance.members).to eq 1
		end
	end
	
	describe '#member_list' do
		it 'returns the value of key "memberList"' do
			expect(instance.member_list).to all be_a ClashOfClansApi::Models::Player
		end
	end
	
	describe '#labels' do
		it 'returns the value of key "labels"' do
			expect(instance.labels).to all be_a ClashOfClansApi::Models::Label
		end
	end
	
	describe '#chat_language' do
		it 'returns the value of key "chatLanguage"' do
			expect(instance.chat_language).to be_a Hash
		end
	end
	
	describe '#required_versus_trophies' do
		it 'returns the value of key "requiredVersusTrophies"' do
			expect(instance.required_versus_trophies).to eq 0
		end
	end
	
	describe '#required_townhall_level' do
		it 'returns the value of key "requiredTownhallLevel"' do
			expect(instance.required_townhall_level).to eq 1
		end
	end
end
