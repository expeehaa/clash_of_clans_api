require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::Label do
	let(:minimal_data) do
		{
			'id'       => 57000008,
			'name'     => 'Active Donator',
			'iconUrls' => {
				'small'  => 'https://api-assets.clashofclans.com/labels/64/MvL0LDt0yv9AI-Vevpu8yE5NAJUIV05Ofpsr4IfGRxQ.png',
				'medium' => 'https://api-assets.clashofclans.com/labels/128/MvL0LDt0yv9AI-Vevpu8yE5NAJUIV05Ofpsr4IfGRxQ.png',
			},
		}
	end
	
	describe '.new' do
		it 'requires 2 arguments' do
			expect{ClashOfClansApi::Models::Label.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::Label.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
		
		it 'validates the argument key requirements' do
			expect{ClashOfClansApi::Models::Label.new({},           4)}.    to raise_error ClashOfClansApi::Models::InvalidDataError, 'The following keys are required, but missing from the model data: "id", "name", "iconUrls"'
			expect{ClashOfClansApi::Models::Label.new(minimal_data, 4)}.not_to raise_error
		end
	end
end
