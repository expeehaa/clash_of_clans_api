require_relative 'base'
require_relative 'clan_war_league_clan_member'
require_relative 'icon_set'

module ClashOfClansApi
	module Models
		class ClanWarLeagueClan < Base
			property :tag,        'tag',       required: true
			property :name,       'name',      required: true
			property :clan_level, 'clanLevel', required: true
			property :badge_urls, 'badgeUrls', required: true, type: IconSet
			property :members,    'members',   required: true, type: ClanWarLeagueClanMember
		end
	end
end
