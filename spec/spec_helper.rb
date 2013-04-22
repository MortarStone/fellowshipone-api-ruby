require File.expand_path( File.dirname(__FILE__) + '/../lib/fellowship_one.rb')

require 'debugger'

require 'vcr'
require 'vcr_setup'
require 'webmock/rspec'

Dir.glob(File.dirname(__FILE__) + "/factories/*").each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end



module F1Keys

  CONSUMER_KEY = '492'
  CONSUMER_SECRET = '9956f9bf-297d-4940-9b17-a0fe50035071'
  ENVIRONMENT = 'staging'
  CHURCH_CODE = 'mortarstone'

  CALLBACK_URL = 'http://www.example.com/fellowship_one_connect'

  OAUTH_TOKEN = '2f843117-a090-41f5-b848-4487d3391e9b'
  OAUTH_SECRET = 'cc780143-7e27-4cf4-bd1b-c4b1385a5e8c'

end


def simulate_connection_to_server
  FellowshipOne::Api.connect(F1Keys::CHURCH_CODE, 
                             F1Keys::CONSUMER_KEY, 
                             F1Keys::CONSUMER_SECRET, 
                             F1Keys::OAUTH_TOKEN, 
                             F1Keys::OAUTH_SECRET, 
                             false)
end