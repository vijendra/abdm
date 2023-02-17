# frozen_string_literal: true

require "abdm_api"
require "vcr"
 
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!
 
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  AbdmAPI.configure do |config|
    config.api_base_url = 'https://healthidsbx.abdm.gov.in'
    config.client_id = "SBX_002274"
    config.client_secret = "a11b3ec0-4188-4af8-a4fd-ac26aa4aad4c"
    config.facility_base_url = 'https://facilitysbx.abdm.gov.in'
  end
  
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
    c.configure_rspec_metadata!
  end
end
