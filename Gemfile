source 'http://rubygems.org'

# Rails
gem 'rails', '3.2.1'

# Server for development
gem 'thin', '1.3.1'

# Rails dependency for linux
gem 'therubyracer', '>= 0.9.9'

# Authentication
gem 'devise', ">=2.0"

# Asset handling

group :assets do
  gem 'sass-rails'
  gem 'coffee-script'
  gem 'uglifier'
  gem 'eventmachine'
end

# Front end
gem 'haml-rails'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'bootstrap-forms'
gem 'kaminari'
gem 'gravatar_image_tag', '1.0.0'
gem 'bourbon'

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
  gem 'ruby-debug19'
  gem 'ruby-prof'

  # Spork
  gem 'spork', '0.9.0'

  # Cucumber
  gem 'cucumber-rails'
  gem 'email_spec'
  gem 'capybara', '1.1.2'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'headless'

  # Rspec
  gem 'turn', '0.8.2', :require => false
  gem 'rspec-rails', '2.8.1'
  gem 'rspec-rails-mocha', '~> 0.3.1', :require => false
  gem 'steak'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'shoulda-matchers'

  # Guards
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-sass'

  # Test Coverage
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false

end

platforms :ruby do
  gem 'rb-readline'

  # notification support
  #  gem 'rb-inotify'
  #  gem 'libnotify'
end

