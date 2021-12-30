require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::PaginatedResponse do
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
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
end
