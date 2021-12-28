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
			'clan'                 => nil,
			'league'               => {
				'id'       => 123,
				'name'     => 'Test rank',
				'iconUrls' => {
					'tiny' => 'https://api-assets.clashofclans.com/leagues/72/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png',
				},
			},
			'legendStatistics'     => nil,
			'achievements'         => nil,
			'versusBattleWinCount' => 3,
			'labels'               => nil,
			'troops'               => nil,
			'heroes'               => nil,
			'spells'               => nil,
		})
	end
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::Player.new}.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 1)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Player.new({})}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "tag", "name", "trophies"'
			expect{instance                               }.not_to raise_error
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
			expect(instance.clan).to eq nil
		end
	end
	
	describe '#league' do
		it 'returns the value of key "league"' do
			expect(instance.league).to be_a ClashOfClansApi::Models::League
		end
	end
	
	describe '#legend_statistics' do
		it 'returns the value of key "legendStatistics"' do
			expect(instance.legend_statistics).to eq nil
		end
	end
	
	describe '#achievements' do
		it 'returns the value of key "achievements"' do
			expect(instance.achievements).to eq nil
		end
	end
	
	describe '#versus_battle_win_count' do
		it 'returns the value of key "versusBattleWinCount"' do
			expect(instance.versus_battle_win_count).to eq 3
		end
	end
	
	describe '#labels' do
		it 'returns the value of key "labels"' do
			expect(instance.labels).to eq nil
		end
	end
	
	describe '#troops' do
		it 'returns the value of key "troops"' do
			expect(instance.troops).to eq nil
		end
	end
	
	describe '#heroes' do
		it 'returns the value of key "heroes"' do
			expect(instance.heroes).to eq nil
		end
	end
	
	describe '#spells' do
		it 'returns the value of key "spells"' do
			expect(instance.spells).to eq nil
		end
	end
end
