source 'http://rubygems.org'

# Rails
gem 'rails', '3.1.3'

# Rails dependency for linux
gem 'therubyracer', '>= 0.9.9'

# Authentication
gem 'devise', '1.4.7'

# Asset handling
gem 'sass-rails'
gem 'coffee-script'
gem 'uglifier'
  
# Front end
gem 'haml-rails'
gem 'jquery-rails'
gem 'simple_form'
gem 'client_side_validations', '3.1.3'
gem 'kaminari'
gem 'gravatar_image_tag', '1.0.0'

group :production do
  # Postgres for Heroku
  gem 'pg'
end

group :test, :development do
  # Dabase for development
  gem 'sqlite3'
  
  # Debugging
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'heroku'
 
  # Debugging
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "ruby-prof"
  
  # Spork
  gem 'spork', '0.9.0.rc9'

  # Cucumber
  gem 'cucumber-rails'
  gem 'email_spec'
  gem 'capybara'
  gem 'webrat'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'launchy'
  
  # Rspec
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  
  # Guards
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rails'
end

