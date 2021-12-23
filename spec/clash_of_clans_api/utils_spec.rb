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
	
	describe '.call_proc_without_unknown_keywords' do
		it 'has the same behaviour as Proc#call when no unknown keywords are defined' do
			expect(                                                          proc{ |a                    | a               }.call               ).to eq nil
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a                    | a               }                   )).to eq nil
			expect(                                                          proc{ |a                    | a               }.call(1, 2, 3      )).to eq 1
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a                    | a               },     1, 2, 3      )).to eq 1
			expect(                                                          proc{ |a, *args             | [a, args]       }.call(1, 2, 3      )).to eq [1, [2, 3]]
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args             | [a, args]       },     1, 2, 3      )).to eq [1, [2, 3]]
			
			expect{                                                          proc{ |                y:   |                 }.call               }.to raise_error ArgumentError, 'missing keyword: :y'
			expect{ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |                y:   |                 }                   )}.to raise_error ArgumentError, 'missing keyword: :y'
			expect{                                                          proc{ |a, *args,       y:   |                 }.call               }.to raise_error ArgumentError, 'missing keyword: :y'
			expect{ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args,       y:   |                 }                   )}.to raise_error ArgumentError, 'missing keyword: :y'
			expect{                                                          proc{ |a, *args,       y:   |                 }.call(         x: 4)}.to raise_error ArgumentError, 'missing keyword: :y'
			expect{ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args,       y:   |                 },              x: 4)}.to raise_error ArgumentError, 'missing keyword: :y'
			expect(                                                          proc{ |a, *args, x:         | [a, args, x]    }.call(1, 2, 3, x: 4)).to eq [1, [2, 3], 4]
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x:         | [a, args, x]    },     1, 2, 3, x: 4)).to eq [1, [2, 3], 4]
			expect(                                                          proc{ |a, *args, x: 2       | [a, args, x]    }.call(1, 2, 3, x: 4)).to eq [1, [2, 3], 4]
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x: 2       | [a, args, x]    },     1, 2, 3, x: 4)).to eq [1, [2, 3], 4]
			expect{                                                          proc{ |a, *args, x: 2, y:   |                 }.call(         x: 4)}.to raise_error ArgumentError, 'missing keyword: :y'
			expect{ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x: 2, y:   |                 },              x: 4)}.to raise_error ArgumentError, 'missing keyword: :y'
			expect(                                                          proc{ |a, *args, x: 2, y: 5 | [a, args, x, y] }.call(1, 2, 3, x: 4)).to eq [1, [2, 3], 4, 5]
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x: 2, y: 5 | [a, args, x, y] },     1, 2, 3, x: 4)).to eq [1, [2, 3], 4, 5]
		end
		
		it 'does not pass unknown keywords to Proc#call' do
			expect(                                                          proc{ |                      |        }.call(x: 4      )).to eq nil
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |                      |        },     x: 4      )).to eq nil
			expect(                                                          proc{ |a, *args              |        }.call(x: 4      )).to eq nil
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args              |        },     x: 4      )).to eq nil
			expect(                                                          proc{ |a, *args, x:          | x      }.call(x: 4      )).to eq 4
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x:          | x      },     x: 4      )).to eq 4
			expect{                                                          proc{ |a, *args, x:          | x      }.call(x: 4, y: 2)}.to raise_error ArgumentError, 'unknown keyword: :y'
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x:          | x      },     x: 4, y: 2)).to eq 4
			expect(                                                          proc{ |a, *args, x:, **kwargs| kwargs }.call(x: 4, y: 2)).to eq({y: 2})
			expect(ClashOfClansApi::Utils.call_proc_without_unknown_keywords(proc{ |a, *args, x:, **kwargs| kwargs },     x: 4, y: 2)).to eq({y: 2})
		end
	end
end
