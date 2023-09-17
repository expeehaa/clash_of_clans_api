require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Player do
	let(:instance) do
		ClashOfClansApi::Models::Player.new({
			'tag'                  => '#QG8VUCRUQ',
			'name'                 => 'Test',
			'townHallLevel'        => 25,
			'townHallWeaponLevel'  => 23,
			'expLevel'             => 684,
			'trophies'             => 8245,
			'bestTrophies'         => 8520,
			'warStars'             => 1234,
			'attackWins'           => 1345,
			'defenseWins'          => 5903,
			'builderHallLevel'     => 14,
			'versusTrophies'       => 5325,
			'bestVersusTrophies'   => 6327,
			'versusBattleWins'     => 2,
			'role'                 => 'adminadmin',
			'warPreference'        => 'inorout',
			'donations'            => 51255132,
			'donationsReceived'    => 154656,
			'clan'                 => {
				'tag'       => '#2YYQPVGQQ',
				'name'      => 'ClashOfClansApi',
				'clanLevel' => 1,
				'badgeUrls' => {
					'small'  => 'https://api-assets.clashofclans.com/badges/70/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
					'large'  => 'https://api-assets.clashofclans.com/badges/512/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
					'medium' => 'https://api-assets.clashofclans.com/badges/200/GgVu5CHf0vL7NNvjqQbqCQpxoPKn6HjvI1V6XNOuWRA.png',
				},
			},
			'league'               => {
				'id'       => 123,
				'name'     => 'Test rank',
				'iconUrls' => {
					'tiny' => 'https://api-assets.clashofclans.com/leagues/72/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png',
				},
			},
			'legendStatistics'     => {
				'legendTrophies' => 12525,
				'previousSeason' => {
					'id'       => '2021-12',
					'rank'     => 13788,
					'trophies' => 5620,
				},
				'bestSeason'     => {
					'id'       => '2021-12',
					'rank'     => 13788,
					'trophies' => 5620,
				},
				'currentSeason'  => {
					'rank'     => 291,
					'trophies' => 4988,
				},
			},
			'achievements'         => [
				{
					'name'           => 'Bigger Coffers',
					'stars'          => 1,
					'value'          => 3,
					'target'         => 5,
					'info'           => 'Upgrade a Gold Storage to level 5',
					'completionInfo' => 'Highest Gold Storage level: 3',
					'village'        => 'home',
				},
				{
					'name'           => 'Get those other Goblins!',
					'stars'          => 1,
					'value'          => 22,
					'target'         => 200,
					'info'           => 'Win 200 Stars on the Campaign Map',
					'completionInfo' => 'Stars in Campaign Map: 22',
					'village'        => 'home',
				},
			],
			'versusBattleWinCount' => 3,
			'labels'               => [
				{
					'id'       => 57000008,
					'name'     => 'Active Donator',
					'iconUrls' => {
						'small'  => 'https://api-assets.clashofclans.com/labels/64/MvL0LDt0yv9AI-Vevpu8yE5NAJUIV05Ofpsr4IfGRxQ.png',
						'medium' => 'https://api-assets.clashofclans.com/labels/128/MvL0LDt0yv9AI-Vevpu8yE5NAJUIV05Ofpsr4IfGRxQ.png',
					},
				},
			],
			'troops'               => [
				{
					'name'     => 'Barbarian',
					'level'    => 10,
					'maxLevel' => 10,
					'village'  => 'home',
				},
			],
			'heroes'               => [
				{
					'name'     => 'Barbarian King',
					'level'    => 78,
					'maxLevel' => 80,
					'village'  => 'home',
				},
			],
			'spells'               => [
				{
					'name'     => 'Invisibility Spell',
					'level'    => 3,
					'maxLevel' => 4,
					'village'  => 'home',
				},
			],
		}, 5)
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Player.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Player.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Player.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "tag", "name"'
			expect{instance                                  }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#tag' do
		it 'returns the value of key "tag"' do
			expect(instance.tag).to eq '#QG8VUCRUQ'
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'Test'
		end
	end
	
	describe '#town_hall_level' do
		it 'returns the value of key "townHallLevel"' do
			expect(instance.town_hall_level).to eq 25
		end
	end
	
	describe '#town_hall_weapon_level' do
		it 'returns the value of key "townHallWeaponLevel"' do
			expect(instance.town_hall_weapon_level).to eq 23
		end
	end
	
	describe '#exp_level' do
		it 'returns the value of key "expLevel"' do
			expect(instance.exp_level).to eq 684
		end
	end
	
	describe '#trophies' do
		it 'returns the value of key "trophies"' do
			expect(instance.trophies).to eq 8245
		end
	end
	
	describe '#best_trophies' do
		it 'returns the value of key "bestTrophies"' do
			expect(instance.best_trophies).to eq 8520
		end
	end
	
	describe '#war_stars' do
		it 'returns the value of key "warStars"' do
			expect(instance.war_stars).to eq 1234
		end
	end
	
	describe '#attack_wins' do
		it 'returns the value of key "attackWins"' do
			expect(instance.attack_wins).to eq 1345
		end
	end
	
	describe '#defense_wins' do
		it 'returns the value of key "defenseWins"' do
			expect(instance.defense_wins).to eq 5903
		end
	end
	
	describe '#builder_hall_level' do
		it 'returns the value of key "builderHallLevel"' do
			expect(instance.builder_hall_level).to eq 14
		end
	end
	
	describe '#versus_trophies' do
		it 'returns the value of key "versusTrophies"' do
			expect(instance.versus_trophies).to eq 5325
		end
	end
	
	describe '#best_versus_trophies' do
		it 'returns the value of key "bestVersusTrophies"' do
			expect(instance.best_versus_trophies).to eq 6327
		end
	end
	
	describe '#versus_battle_wins' do
		it 'returns the value of key "versusBattleWins"' do
			expect(instance.versus_battle_wins).to eq 2
		end
	end
	
	describe '#role' do
		it 'returns the value of key "role"' do
			expect(instance.role).to eq 'adminadmin'
		end
	end
	
	describe '#war_preference' do
		it 'returns the value of key "warPreference"' do
			expect(instance.war_preference).to eq 'inorout'
		end
	end
	
	describe '#donations' do
		it 'returns the value of key "donations"' do
			expect(instance.donations).to eq 51255132
		end
	end
	
	describe '#donations_received' do
		it 'returns the value of key "donationsReceived"' do
			expect(instance.donations_received).to eq 154656
		end
	end
	
	describe '#clan' do
		it 'returns the value of key "clan"' do
			expect(instance.clan).to be_a ClashOfClansApi::Models::Clan
		end
	end
	
	describe '#league' do
		it 'returns the value of key "league"' do
			expect(instance.league).to be_a ClashOfClansApi::Models::League
		end
	end
	
	describe '#legend_statistics' do
		it 'returns the value of key "legendStatistics"' do
			expect(instance.legend_statistics).to be_a ClashOfClansApi::Models::LegendStatistics
		end
	end
	
	describe '#achievements' do
		it 'returns the value of key "achievements"' do
			expect(instance.achievements     ).to all be_a ClashOfClansApi::Models::Achievement
			expect(instance.achievements.size).to eq 2
		end
	end
	
	describe '#labels' do
		it 'returns the value of key "labels"' do
			expect(instance.labels     ).to all be_a ClashOfClansApi::Models::Label
			expect(instance.labels.size).to eq 1
		end
	end
	
	describe '#troops' do
		it 'returns the value of key "troops"' do
			expect(instance.troops     ).to all be_a ClashOfClansApi::Models::Troop
			expect(instance.troops.size).to eq 1
		end
	end
	
	describe '#heroes' do
		it 'returns the value of key "heroes"' do
			expect(instance.heroes     ).to all be_a ClashOfClansApi::Models::Hero
			expect(instance.heroes.size).to eq 1
		end
	end
	
	describe '#spells' do
		it 'returns the value of key "spells"' do
			expect(instance.spells     ).to all be_a ClashOfClansApi::Models::Spell
			expect(instance.spells.size).to eq 1
		end
	end
end
