source 'http://rubygems.org'

# Rails
gem 'rails', '3.2.2'

# Server for development
gem 'thin', '1.3.1'

# Rails dependency for linux
# gem 'therubyracer', '>= 0.9.9'

# Authentication
gem 'devise', "2.0"

# Asset handling
gem 'sass-rails', '3.2.3'
gem 'bootstrap-sass', '~> 2.0.1'

group :assets do
  gem 'coffee-script'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
  gem 'eventmachine'
end

# Front end
gem 'haml-rails'
gem 'jquery-rails', '2.0.0'
gem 'bootstrap-forms'
gem 'kaminari'
gem 'gravatar_image_tag', '1.0.0'
gem 'bourbon'
gem 'best_in_place'

# db
gem 'pg', '0.12.2'

group :test, :development do

  # Debugging
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'taps'
  gem 'heroku'
  gem 'ruby-debug19'
  gem 'ruby-prof'

  # Rspec
  gem 'rspec-rails', '2.8.1'
  #gem 'rspec-rails-mocha', '~> 0.3.1'
  gem 'steak'
  gem 'factory_girl_rails'
  gem 'faker', '1.0.1'
  gem 'shoulda-matchers'

end

group :test do

  # Spork
  gem 'spork', '0.9.0'

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
  gem 'guard-rspec', '0.5.5'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-sass'

end


platforms :ruby do
  gem 'rb-readline'

  # notification support
  #  gem 'rb-inotify'
  #  gem 'libnotify'
end

