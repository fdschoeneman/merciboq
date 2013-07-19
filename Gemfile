source 'http://rubygems.org'

# Rails
gem 'rails', '4.0.0'

# database
  gem 'pg'
# Server for development
gem 'thin'

# Rails dependency for linux
# gem 'therubyracer', '>= 0.9.9'

# Authentication
gem 'devise', '~> 3.0.0.rc'
gem 'simple_form', '~> 3.0.0.rc'
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
gem 'gravatar_image_tag'
gem 'bourbon'
# gem 'best_in_place'
gem 'faker'

group :production do 
  # database
  # gem bu'pg', '0.12.2'
end

group :test, :development do

  # Debugging
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'taps'

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
  
  gem 'debugger'
  
  # notification support
  gem 'rb-inotify'
  gem 'libnotify'
end

