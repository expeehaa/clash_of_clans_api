require 'spec_helper'

RSpec.describe ClashOfClansApi::Models::IconSet do
	let(:instance) do
		ClashOfClansApi::Models::IconSet.new({
			'tiny'   => 'tiny',
			'small'  => 'small',
			'medium' => 'medium',
			'large'  => 'large',
		}, 5)
	end
	
	describe '.new' do
		it 'requires two arguments' do
			expect{ClashOfClansApi::Models::IconSet.new    }.to raise_error ArgumentError, 'wrong number of arguments (given 0, expected 2)'
			expect{ClashOfClansApi::Models::IconSet.new({})}.to raise_error ArgumentError, 'wrong number of arguments (given 1, expected 2)'
		end
	end
	
	describe '#client' do
		it 'returns the second constructor argument' do
			expect(instance.client).to eq 5
		end
	end
	
	describe '#tiny' do
		it 'returns thevalue of key "tiny"' do
			expect(instance.tiny).to eq 'tiny'
		end
	end
	
	describe '#small' do
		it 'returns thevalue of key "small"' do
			expect(instance.small).to eq 'small'
		end
	end
	
	describe '#medium' do
		it 'returns thevalue of key "medium"' do
			expect(instance.medium).to eq 'medium'
		end
	end
	
	describe '#large' do
		it 'returns thevalue of key "large"' do
			expect(instance.large).to eq 'large'
		end
	end
end
