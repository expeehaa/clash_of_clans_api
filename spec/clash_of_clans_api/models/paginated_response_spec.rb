require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::PaginatedResponse do
	let(:minimal_data) do
		{
			'items'  => [],
			'paging' => {},
		}
	end
	let(:instance) do
		ClashOfClansApi::Models::PaginatedResponse.new(String, {
			'items'  => [
				'a test',
				'some other string',
				'cow',
			],
			'paging' => {
				'cursor' => {
					'after' => 'test',
				},
			},
		}, 5)
	end
	
	describe '.new' do
		it 'returns an instance of ClashOfClansApi::Models::PaginatedResponse' do
			expect(instance      ).to be_a ClashOfClansApi::Models::Base
			expect(instance      ).to be_a ClashOfClansApi::Models::PaginatedResponse
			expect(instance.items).to all be_a String
			expect(instance.items).to eq ['a test', 'some other string', 'cow']
		end
	end
	
	describe '#expected_properties?' do
		it 'returns true only with at least the minimal data given' do
			(0...minimal_data.length).each do |i|
				minimal_data.to_a.combination(i).each do |combination|
					expect(ClashOfClansApi::Models::PaginatedResponse.new(String, combination.to_h, nil).expected_properties?).to be false
				end
			end
			
			expect(ClashOfClansApi::Models::PaginatedResponse.new(String, minimal_data, nil).expected_properties?).to be true
		end
	end
end
