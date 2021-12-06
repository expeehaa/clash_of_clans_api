require 'spec_helper'

RSpec.describe ClashOfClansApi::Tags do
	PROPER_TAGS = %w[
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
	
	SANITIZABLE_TAGS = [
		'  #29YLJCUL0  ',
		'29YLJCUL0',
		'#29YLJCULO',
		'#29yljcul0',
		'  29yljculo    ',
	]
	
	WRONG_TAGS = %w[
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
	
	describe '.tag_regex' do
		it 'matches all PROPER_TAGS' do
			PROPER_TAGS.each do |tag|
				expect(tag).to match ClashOfClansApi::Tags.tag_regex
			end
		end
		
		it 'does not match any SANITIZABLE_TAGS' do
			SANITIZABLE_TAGS.each do |tag|
				expect(tag).not_to match ClashOfClansApi::Tags.tag_regex
			end
		end
		
		it 'does not match any WRONG_TAGS' do
			WRONG_TAGS.each do |tag|
				expect(tag).not_to match ClashOfClansApi::Tags.tag_regex
			end
		end
	end
	
	describe '.sanitizable_tag_regex' do
		it 'matches all PROPER_TAGS' do
			PROPER_TAGS.each do |tag|
				expect(tag).to match ClashOfClansApi::Tags.sanitizable_tag_regex
			end
		end
		
		it 'matches all SANITIZABLE_TAGS' do
			SANITIZABLE_TAGS.each do |tag|
				expect(tag).to match ClashOfClansApi::Tags.sanitizable_tag_regex
			end
		end
		
		it 'does not match any WRONG_TAGS' do
			WRONG_TAGS.each do |tag|
				expect(tag).not_to match ClashOfClansApi::Tags.sanitizable_tag_regex
			end
		end
	end
	
	describe '.sanitizable?' do
		it 'returns true for all PROPER_TAGS' do
			PROPER_TAGS.each do |tag|
				expect(ClashOfClansApi::Tags.sanitizable?(tag)).to eq true
			end
		end
		
		it 'returns true for all SANITIZABLE_TAGS' do
			SANITIZABLE_TAGS.each do |tag|
				expect(ClashOfClansApi::Tags.sanitizable?(tag)).to eq true
			end
		end
		
		it 'returns false for all WRONG_TAGS' do
			WRONG_TAGS.each do |tag|
				expect(ClashOfClansApi::Tags.sanitizable?(tag)).to eq false
			end
		end
	end
	
	describe '.sanitize' do
		it 'returns all PROPER_TAGS unchanged' do
			PROPER_TAGS.each do |tag|
				expect(ClashOfClansApi::Tags.sanitize(tag)).to eq tag
			end
		end
		
		it 'sanitizes all SANITIZABLE_TAGS' do
			SANITIZABLE_TAGS.each do |tag|
				expect(ClashOfClansApi::Tags.sanitize(tag)).to eq '#29YLJCUL0'
			end
		end
	end
end
