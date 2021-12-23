require 'spec_helper'

RSpec.describe ClashOfClansApi::Utils do
	describe '.url_escape' do
		it 'raises a TypeError when passed nil' do
			expect{ClashOfClansApi::Utils.url_escape(nil)}.to raise_error TypeError, 'cannot escape nil'
		end
		
		it 'URL-escapes strings and other types' do
			expect(ClashOfClansApi::Utils.url_escape('a#%B789=&' )).to eq 'a%23%25B789%3D%26'
			expect(ClashOfClansApi::Utils.url_escape(:a=         )).to eq 'a%3D'
			expect(ClashOfClansApi::Utils.url_escape(1125215     )).to eq '1125215'
			expect(ClashOfClansApi::Utils.url_escape({a: 2, b: 5})).to eq '%7B%3Aa%3D%3E2%2C+%3Ab%3D%3E5%7D'
		end
	end
end
