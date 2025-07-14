# frozen_string_literal: true

require 'irb'
require 'clash_of_clans_api'

require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
	config.hook_into :webmock
	config.cassette_library_dir     = File.expand_path('cassettes', __dir__)
	config.default_cassette_options = {
		record: ENV.fetch('VCR_RECORD', 'false') == 'true' ? :all : :none,
	}
	config.filter_sensitive_data('<TOKEN>') { ENV.fetch('CLASH_OF_CLANS_API_TOKEN', nil) }
	config.before_record do |interaction|
		# This assumes that responses are actually always encoded as UTF-8, although Ruby seems to think otherwise sometimes.
		# Without this, serialization of cassettes may have responses as base64-encoded strings (if e.g. a player name includes non-ASCII characters), which makes the cassette diff quite hard to read.
		interaction.response.body.force_encoding(Encoding::UTF_8)
	end
end

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = '.rspec_status'
	
	# Disable RSpec exposing methods globally on `Module` and `main`
	config.disable_monkey_patching!
	
	config.expect_with :rspec do |c|
		c.syntax = :expect
	end
	
	config.around do |example|
		if example.metadata[:vcr_cassette]
			VCR.use_cassette(example.metadata[:vcr_cassette]) do
				example.run
			end
		else
			example.run
		end
	end
end

require_relative 'test_helpers/model_test_helper'
