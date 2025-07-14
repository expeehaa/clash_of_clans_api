require_relative 'base'

module ClashOfClansApi
	module Models
		class Achievement < Base
			property :name,            'name',           expected: true
			property :stars,           'stars',          expected: true
			property :value,           'value',          expected: true
			property :target,          'target',         expected: true
			property :info,            'info',           expected: true
			property :completion_info, 'completionInfo', expected: true
			property :village,         'village',        expected: true
		end
	end
end
