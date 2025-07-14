require_relative 'base'
require_relative 'achievement'
require_relative 'builder_base_league'
require_relative 'hero'
require_relative 'hero_equipment'
require_relative 'label'
require_relative 'league'
require_relative 'legend_statistics'
require_relative 'player_house'
require_relative 'spell'
require_relative 'troop'

module ClashOfClansApi
	module Models
		class Player < Base
			property :tag,                        'tag',  expected: true
			property :name,                       'name', expected: true
			property :town_hall_level,            'townHallLevel'
			property :town_hall_weapon_level,     'townHallWeaponLevel'
			property :exp_level,                  'expLevel'
			property :trophies,                   'trophies'
			property :best_trophies,              'bestTrophies'
			property :war_stars,                  'warStars'
			property :attack_wins,                'attackWins'
			property :defense_wins,               'defenseWins'
			property :builder_hall_level,         'builderHallLevel'
			property :builder_base_trophies,      'builderBaseTrophies'
			property :best_builder_base_trophies, 'bestBuilderBaseTrophies'
			property :role,                       'role'
			property :war_preference,             'warPreference'
			property :clan_rank,                  'clanRank'
			property :previous_clan_rank,         'previousClanRank'
			property :donations,                  'donations'
			property :donations_received,         'donationsReceived'
			property :rank,                       'rank'
			property :clan_capital_contributions, 'clanCapitalContributions'
			property :clan,                       'clan',              type: 'ClashOfClansApi::Models::Clan'
			property :league,                     'league',            type: League
			property :builder_base_league,        'builderBaseLeague', type: BuilderBaseLeague
			property :legend_statistics,          'legendStatistics',  type: LegendStatistics
			property :achievements,               'achievements',      type: Achievement
			property :player_house,               'playerHouse',       type: PlayerHouse
			property :labels,                     'labels',            type: Label
			property :troops,                     'troops',            type: Troop
			property :heroes,                     'heroes',            type: Hero
			property :spells,                     'spells',            type: Spell
			property :hero_equipment,             'heroEquipment',     type: HeroEquipment
		end
	end
end
