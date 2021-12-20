require_relative 'base'

module ClashOfClansApi
	module Models
		class IconSet < Base
			property :tiny,   'tiny'
			property :small,  'small'
			property :medium, 'medium'
			property :large,  'large'
		end
	end
end
