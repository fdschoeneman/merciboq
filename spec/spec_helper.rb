require 'rubygems'


ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'factory_girl_rails'
require 'shoulda-matchers'
require 'email_spec'
require 'turnip/capybara'
require 'turnip_helper'

Capybara.javascript_driver = :webkit

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Warden::Test::Helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  # config.include ::Rails.application.routes.url_helpers

  config.include FactoryGirl::Syntax::Methods
  config.include EmailMacros

  config.mock_with :rspec
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

FactoryGirl.reload

Dir["#{Rails.root}/app/controllers//*.rb"].each do |controller|
  load controller
end
Dir["#{Rails.root}/app/models//*.rb"].each do |model|
  load model
end
Dir["#{Rails.root}/app/workers//*.rb"].each do |worker|
  load worker
end
Dir["#{Rails.root}/app/mailers//*.rb"].each do |mailer|
  load mailer
end
Dir["#{Rails.root}/lib//*.rb"].each do |lib|
  load lib
end
