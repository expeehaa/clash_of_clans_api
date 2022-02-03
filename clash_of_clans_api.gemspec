# frozen_string_literal: true

require_relative 'lib/clash_of_clans_api/version'

Gem::Specification.new do |spec|
	spec.name     = 'clash_of_clans_api'
	spec.version  = ClashOfClansApi::VERSION
	spec.authors  = ['expeehaa']
	spec.email    = ['expeehaa@outlook.com']
	spec.summary  = 'Client library for interacting with the ClashOfClans API.'
	spec.homepage = 'https://github.com/expeehaa/clash_of_clans_api'
	
	spec.metadata['allowed_push_host']     = 'https://rubygems.org'
	spec.metadata['rubygems_mfa_required'] = 'true'
	
	spec.files         = Dir['lib/**/*.rb', 'README.adoc']
	spec.require_paths = ['lib']
	
	spec.required_ruby_version = '>= 2.6.0'
end
