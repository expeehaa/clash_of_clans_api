require_relative 'base'
require_relative 'achievement'
require_relative 'clan'
require_relative 'hero'
require_relative 'label'
require_relative 'league'
require_relative 'legend_statistics'
require_relative 'spell'
require_relative 'troop'

module ClashOfClansApi
	module Models
		class Player < Base
			property :tag,                     'tag',                  required: true
			property :name,                    'name',                 required: true
			property :town_hall_level,         'townHallLevel'
			property :town_hall_weapon_level,  'townHallWeaponLevel'
			property :exp_level,               'expLevel'
			property :trophies,                'trophies',             required: true
			property :best_trophies,           'bestTrophies'
			property :war_stars,               'warStars'
			property :attack_wins,             'attackWins'
			property :defense_wins,            'defenseWins'
			property :builder_hall_level,      'builderHallLevel'
			property :versus_trophies,         'versusTrophies'
			property :best_versus_trophies,    'bestVersusTrophies'
			property :versus_battle_wins,      'versusBattleWins'
			property :role,                    'role'
			property :war_preference,          'warPreference'
			property :donations,               'donations'
			property :donations_received,      'donationsReceived'
			property :rank,                    'rank'
			property :clan,                    'clan',                 type: Clan
			property :league,                  'league',               type: League
			property :legend_statistics,       'legendStatistics',     type: LegendStatistics
			property :achievements,            'achievements',         type: Achievement
			property :versus_battle_win_count, 'versusBattleWinCount'
			property :labels,                  'labels',               type: Label
			property :troops,                  'troops',               type: Troop
			property :heroes,                  'heroes',               type: Hero
			property :spells,                  'spells',               type: Spell
		end
	end
end
