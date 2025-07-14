require_relative 'base'
require_relative 'clan_war_league_clan_member'
require_relative 'icon_set'

module ClashOfClansApi
	module Models
		class ClanWarLeagueClan < Base
			property :tag,        'tag',       expected: true
			property :name,       'name',      expected: true
			property :clan_level, 'clanLevel', expected: true
			property :badge_urls, 'badgeUrls', expected: true, type: IconSet
			property :members,    'members',   expected: true, type: ClanWarLeagueClanMember
		end
	end
end
