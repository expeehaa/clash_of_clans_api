require_relative 'base'
require_relative 'war_clan'

module ClashOfClansApi
	module Models
		class War < Base
			property :state,                  'state'
			property :result,                 'result'
			property :start_time,             'startTime',                        type: DateTime
			property :end_time,               'endTime',                          type: DateTime
			property :preparation_start_time, 'preparationStartTime',             type: DateTime
			property :team_size,              'teamSize'
			property :attacks_per_member,     'attacksPerMember'
			property :clan,                   'clan',             required: true, type: WarClan
			property :opponent,               'opponent',         required: true, type: WarClan
		end
	end
end
