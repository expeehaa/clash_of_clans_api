require_relative 'base'

module ClashOfClansApi
	module Models
		class ChatLanguage < Base
			property :id,            'id',           required: true
			property :name,          'name',         required: true
			property :language_code, 'languageCode', required: true
		end
	end
end
