require_relative 'base'

module ClashOfClansApi
	module Models
		class League < Base
			property :id,        'id',       required: true
			property :name,      'name',     required: true
			property :icon_urls, 'iconUrls'
		end
	end
end
