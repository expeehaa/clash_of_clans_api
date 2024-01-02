require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::ClanWarLeagueRound do
	let(:prepared_round) do
		ClashOfClansApi::Models::ClanWarLeagueRound.new({
			'warTags' => %w[
				#PYLQG
				#PYLQR
				#PYLQJ
				#PYLQC
			],
		}, :not_a_client)
	end
	let(:unprepared_round) do
		ClashOfClansApi::Models::ClanWarLeagueRound.new({
			'warTags' => ['#0'] * 4,
		}, :not_a_client)
	end
	let(:partially_prepared_round) do
		ClashOfClansApi::Models::ClanWarLeagueRound.new({
			'warTags' => %w[
				#PYLQG
				#PYLQR
				#0
				#0
			],
		}, :not_a_client)
	end
	
	describe '#prepared?' do
		it 'returns false for an unprepared or partially prepared round' do
			expect(        unprepared_round.prepared?).to be false
			expect(partially_prepared_round.prepared?).to be false
		end
		
		it 'returns true for a prepared round' do
			expect(prepared_round.prepared?).to be true
		end
	end
end
