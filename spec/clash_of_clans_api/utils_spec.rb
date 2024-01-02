require 'spec_helper'

RSpec.describe ClashOfClansApi::Utils do
	describe '.current_ipv4_address' do
		around do |example|
			VCR.turned_off do
				example.run
			end
		end
		
		it 'asks ipv4.icanhazip.com for the IPv4 address of the host' do
			stub_request(:get, 'https://ipv4.icanhazip.com').to_return(body: '127.0.0.2')
			
			expect(ClashOfClansApi::Utils.current_ipv4_address).to eq '127.0.0.2'
		end
		
		it 'ensures that the answer from ipv4.icanhazip.com is a valid IPv4 address' do
			stub_request(:get, 'https://ipv4.icanhazip.com').to_return(body: 'not an IP address')
			
			expect{ClashOfClansApi::Utils.current_ipv4_address}.to raise_error IPAddr::InvalidAddressError, 'invalid address: '
		end
	end
end
