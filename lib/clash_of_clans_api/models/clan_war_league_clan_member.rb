require_relative 'base'

module ClashOfClansApi
	module Models
		class ClanWarLeagueClanMember < Base
			property :tag,            'tag',           required: true
			property :name,           'name',          required: true
			property :townhall_level, 'townhallLevel', required: true
		end
	end
end
