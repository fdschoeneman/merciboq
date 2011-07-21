require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here,
  # you'll need to restart spork for it take effect.

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include Devise::TestHelpers, :type => :controller
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matchers

    config.mock_with :rspec

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = true
  end
end

Spork.each_run do
end

