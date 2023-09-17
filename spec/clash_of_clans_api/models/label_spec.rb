require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Label do
	let(:instance) do
		ClashOfClansApi::Models::Label.new({
			'id'       => 57000008,
			'name'     => 'Active Donator',
			'iconUrls' => {
				'small'  => 'https://api-assets.clashofclans.com/labels/64/MvL0LDt0yv9AI-Vevpu8yE5NAJUIV05Ofpsr4IfGRxQ.png',
				'medium' => 'https://api-assets.clashofclans.com/labels/128/MvL0LDt0yv9AI-Vevpu8yE5NAJUIV05Ofpsr4IfGRxQ.png',
			},
		}, 5)
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Label.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Label.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Label.new({}, 4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "id", "name", "iconUrls"'
			expect{instance                                       }.not_to raise_error
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#id' do
		it 'returns the value of key "id"' do
			expect(instance.id).to eq 57000008
		end
	end
	
	describe '#name' do
		it 'returns the value of key "name"' do
			expect(instance.name).to eq 'Active Donator'
		end
	end
	
	describe '#icon_urls' do
		it 'returns the value of key "iconUrls"' do
			expect(instance.icon_urls).to be_a ClashOfClansApi::Models::IconSet
		end
	end
end
