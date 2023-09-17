require_relative 'base'
require_relative 'capital_league'
require_relative 'chat_language'
require_relative 'clan_capital'
require_relative 'clan_location'
require_relative 'icon_set'
require_relative 'label'
require_relative 'war_league'

module ClashOfClansApi
	module Models
		class Clan < Base
			property :tag,                            'tag',  required: true
			property :name,                           'name', required: true
			property :type,                           'type'
			property :description,                    'description'
			property :location,                       'location',                    type: ClanLocation
			property :family_friendly?,               'isFamilyFriendly'
			property :badge_urls,                     'badgeUrls',                   type: IconSet
			property :clan_level,                     'clanLevel'
			property :clan_points,                    'clanPoints'
			property :clan_builder_base_points,       'clanBuilderBasePoints'
			property :clan_versus_points,             'clanVersusPoints'
			property :clan_capital_points,            'clanCapitalPoints'
			property :capital_league,                 'capitalLeague',               type: CapitalLeague
			property :required_trophies,              'requiredTrophies'
			property :war_frequency,                  'warFrequency'
			property :war_win_streak,                 'warWinStreak'
			property :war_wins,                       'warWins'
			property :war_ties,                       'warTies'
			property :war_losses,                     'warLosses'
			property :war_log_public?,                'isWarLogPublic'
			property :war_league,                     'warLeague',                   type: WarLeague
			property :members,                        'members'
			property :member_list,                    'memberList',                  type: 'ClashOfClansApi::Models::Player'
			property :labels,                         'labels',                      type: Label
			property :required_builder_base_trophies, 'requiredBuilderBaseTrophies'
			property :required_versus_trophies,       'requiredVersusTrophies'
			property :required_townhall_level,        'requiredTownhallLevel'
			property :clan_capital,                   'clanCapital',                 type: ClanCapital
			property :chat_language,                  'chatLanguage',                type: ChatLanguage
		end
	end
end
