require_relative 'base'
require_relative 'icon_set'

module ClashOfClansApi
	module Models
		class Label < Base
			property :id,        'id',       expected: true
			property :name,      'name',     expected: true
			property :icon_urls, 'iconUrls', expected: true, type: IconSet
		end
	end
end
