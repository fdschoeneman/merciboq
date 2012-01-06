require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'capybara/rails'
  require 'email_spec'
  require 'email_spec/cucumber'

  Capybara.save_and_open_page_path = 'tmp'
  Capybara.default_selector = :css
  Capybara.javascript_driver = :selenium
  Capybara.register_driver :selenium do |app|
  
  Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end

Spork.each_run do


end

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end


