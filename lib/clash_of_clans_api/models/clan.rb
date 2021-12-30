require_relative 'base'
require_relative 'icon_set'

module ClashOfClansApi
	module Models
		class Clan < Base
			property :tag,        'tag',       required: true
			property :name,       'name',      required: true
			property :clan_level, 'clanLevel', required: true
			property :badge_urls, 'badgeUrls', required: true, type: IconSet
		end
	end
end
