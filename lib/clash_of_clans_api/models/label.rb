require_relative 'base'
require_relative 'icon_set'

module ClashOfClansApi
	module Models
		class Label < Base
			property :id,        'id',       required: true
			property :name,      'name',     required: true
			property :icon_urls, 'iconUrls', required: true, type: IconSet
		end
	end
end
