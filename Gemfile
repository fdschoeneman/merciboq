source 'http://rubygems.org'

# Rails
gem 'rails', '3.2.9'

# Server for development
gem 'thin', '1.3.1'

# Rails dependency for linux
# gem 'therubyracer', '>= 0.9.9'

# Authentication
gem 'devise'
gem 'simple_form'
gem 'wicked'

# Asset handling
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
      
group :assets do
  gem 'coffee-script'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'eventmachine'
end

# Front end
gem 'haml-rails'
gem 'jquery-rails'
gem 'bootstrap-forms'
gem 'kaminari'
gem 'gravatar_image_tag', '1.0.0'
gem 'bourbon'
gem 'best_in_place'
gem 'faker', '1.0.1'

group :production do 
  # database
  gem 'pg', '0.12.2'
end

group :test, :development do

  # Debugging
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'taps'
  gem 'sqlite3'

  # Rspec
  gem 'rspec-rails'
  gem 'steak'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'rspec-given'
end

group :test do

  # turnip allows cucumber features in rspec
  gem 'turnip'
  # Spork
  gem 'spork'

  # Cucumber
  gem 'email_spec'
  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'headless'

  # Guards
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-sass', require: false
end

group :development do 
  # notification support
  gem 'debugger'
  gem 'rb-inotify'
  gem 'libnotify'
end
# platforms :ruby do
  # gem 'rb-readline'

# end

