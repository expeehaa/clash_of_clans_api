require_relative 'base'
require_relative 'icon_set'
require_relative 'label'

module ClashOfClansApi
	module Models
		class Clan < Base
			property :tag,        'tag',       required: true
			property :name,       'name',      required: true
			property :clan_level, 'clanLevel', required: true
			property :badge_urls, 'badgeUrls', required: true, type: IconSet
			property :type,                     'type'
			property :location,                 'location'
			property :clan_points,              'clanPoints'
			property :clan_versus_points,       'clanVersusPoints'
			property :required_trophies,        'requiredTrophies'
			property :war_frequency,            'warFrequency'
			property :war_win_streak,           'warWinStreak'
			property :war_wins,                 'warWins'
			property :war_ties,                 'warTies'
			property :war_losses,               'warLosses'
			property :is_war_log_public,        'isWarLogPublic'
			property :war_league,               'warLeague'
			property :members,                  'members'
			property :member_list,              'memberList',             type: 'ClashOfClansApi::Models::Player'
			property :labels,                   'labels',                 type: Label
			property :chat_language,            'chatLanguage'
			property :required_versus_trophies, 'requiredVersusTrophies'
			property :required_townhall_level,  'requiredTownhallLevel'
		end
	end
end
