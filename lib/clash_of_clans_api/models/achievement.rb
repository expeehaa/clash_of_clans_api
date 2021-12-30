require_relative 'base'

module ClashOfClansApi
	module Models
		class Achievement < Base
			property :name,            'name',           required: true
			property :stars,           'stars',          required: true
			property :value,           'value',          required: true
			property :target,          'target',         required: true
			property :info,            'info',           required: true
			property :completion_info, 'completionInfo', required: true
			property :village,         'village',        required: true
		end
	end
end
