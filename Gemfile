source 'http://rubygems.org'

gem 'typhoeus', '>=0.5.0'
gem 'json'
gem 'oauth', '0.4.7' # lock to this version until our patch is accepted upstream

group :development, :test do
  gem 'autotest'
  gem 'rspec'
  gem 'debugger'
  gem 'factory_girl'

  gem 'vcr'
  gem 'webmock', '1.9' # Currently does not work with Typhoeus 0.4.2 - THIS SUCKS!
end