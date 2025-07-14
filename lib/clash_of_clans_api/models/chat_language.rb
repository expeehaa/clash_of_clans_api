require_relative 'base'

module ClashOfClansApi
	module Models
		class ChatLanguage < Base
			property :id,            'id',           expected: true
			property :name,          'name',         expected: true
			property :language_code, 'languageCode', expected: true
		end
	end
end
