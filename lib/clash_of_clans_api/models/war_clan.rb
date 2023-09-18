require_relative 'base'
require_relative 'icon_set'
require_relative 'war_clan_member'

module ClashOfClansApi
	module Models
		class WarClan < Base
			property :tag,                    'tag'
			property :name,                   'name'
			property :badge_urls,             'badgeUrls', type: IconSet
			property :clan_level,             'clanLevel'
			property :attacks,                'attacks'
			property :stars,                  'stars'
			property :destruction_percentage, 'destructionPercentage'
			property :exp_earned,             'expEarned'
			property :members,                'members', type: WarClanMember
		end
	end
end
