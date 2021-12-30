require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::League do
	let(:instance) { ClashOfClansApi::Models::League.new({'id' => 123, 'name' => 'Test rank', 'iconUrls' => {'tiny' => 'https://api-assets.clashofclans.com/leagues/72/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png'}}, 5) }
	
	describe '.new' do
		it 'requires an argument' do
			expect{ClashOfClansApi::Models::League.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::League.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::League.new({                          }, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "id", "name"'
			expect{ClashOfClansApi::Models::League.new({'id' => nil               }, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "name"'
			expect{ClashOfClansApi::Models::League.new({             'name' => nil}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "id"'
			expect{ClashOfClansApi::Models::League.new({'id' => nil, 'name' => nil}, 4)}.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#id' do
		it 'returns the value of key "id"' do
			expect(instance.id).to eq 123
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'Test rank'
		end
	end
	
	describe '#icon_urls' do
		it 'returns the value of key "iconUrls"' do
			expect(instance.icon_urls     ).to be_a ClashOfClansApi::Models::IconSet
			expect(instance.icon_urls.tiny).to eq   'https://api-assets.clashofclans.com/leagues/72/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png'
		end
	end
end
