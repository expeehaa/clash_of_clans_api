require 'spec_helper'

RSpec::Matchers.define_negated_matcher :not_match, :match

RSpec.describe ClashOfClansApi::Tags do
	let(:proper_tags) do
		%w[
			#29YLJCUL0
			#8GG8VGQGR
			#898YCPRQ2
			#Q29GYVCL
			#Q28PVLG8
			#9GYP292CY
			#89C9UU9C8
			#8P8P9RRRU
			#URLQVUVQ
			#8PYL89Q0L
			#8L89PJPP
			#2PPULRUU9
			#290LR8RLG
			#8QJY9V8P
			#2Y8YVGP8V
			#9GP02C22
			#PV8QPQLG
			#28C8V8GP2
			#8QUY8RPR
			#2YYLC0VRP
			#P
			#Y
			#L
			#Q
			#G
			#R
			#J
			#C
			#U
			#V
			#0
			#2
			#8
			#9
		]
	end
	
	let(:sanitizable_tags) do
		[
			'  #29YLJCUL0  ',
			'29YLJCUL0',
			'#29YLJCULO',
			'#29yljcul0',
			'  29yljculo    ',
		]
	end
	
	let(:wrong_tags) do
		%w[
			*29YLJCUL0
			#A
			#B
			#D
			#E
			#F
			#H
			#I
			#K
			#M
			#N
			#S
			#T
			#W
			#X
			#Z
			#1
			#3
			#4
			#5
			#6
			#7
		]
	end
	
	describe '.tag_regex' do
		it 'matches all proper_tags' do
			expect(proper_tags     ).to all     match ClashOfClansApi::Tags.tag_regex
		end
		
		it 'does not match any sanitizable_tags' do
			expect(sanitizable_tags).to all not_match ClashOfClansApi::Tags.tag_regex
		end
		
		it 'does not match any wrong_tags' do
			expect(wrong_tags      ).to all not_match ClashOfClansApi::Tags.tag_regex
		end
	end
	
	describe '.sanitizable_tag_regex' do
		it 'matches all proper_tags' do
			expect(proper_tags     ).to all     match ClashOfClansApi::Tags.sanitizable_tag_regex
		end
		
		it 'matches all sanitizable_tags' do
			expect(sanitizable_tags).to all     match ClashOfClansApi::Tags.sanitizable_tag_regex
		end
		
		it 'does not match any wrong_tags' do
			expect(wrong_tags      ).to all not_match ClashOfClansApi::Tags.sanitizable_tag_regex
		end
	end
	
	describe '.sanitizable?' do
		it 'returns true for all proper_tags' do
			proper_tags.each do |tag|
				expect(ClashOfClansApi::Tags.sanitizable?(tag)).to eq true
			end
		end
		
		it 'returns true for all sanitizable_tags' do
			sanitizable_tags.each do |tag|
				expect(ClashOfClansApi::Tags.sanitizable?(tag)).to eq true
			end
		end
		
		it 'returns false for all wrong_tags' do
			wrong_tags.each do |tag|
				expect(ClashOfClansApi::Tags.sanitizable?(tag)).to eq false
			end
		end
	end
	
	describe '.sanitize' do
		it 'returns all proper_tags unchanged' do
			proper_tags.each do |tag|
				expect(ClashOfClansApi::Tags.sanitize(tag)).to eq tag
			end
		end
		
		it 'sanitizes all sanitizable_tags' do
			sanitizable_tags.each do |tag|
				expect(ClashOfClansApi::Tags.sanitize(tag)).to eq '#29YLJCUL0'
			end
		end
	end
end
