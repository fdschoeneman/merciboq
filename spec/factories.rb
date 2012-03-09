require 'factory_girl'

#Factory.define :user do |user|
#  user.name                   "test name"
#  user.email                  "test.name@gmail.com"
#  user.subdomain              "testuser"
#  user.password               "foobar"
#  user.password_confirmation  "foobar"
#end

Factory.define :welcomer do |welcomer|
  welcomer.name                   "welcomer name"
  welcomer.email                  "welcomer.name@gmail.com"
  welcomer.subdomain              "testwelcomer"
  welcomer.password               "bazquux"
  welcomer.password_confirmation  "bazquux"
end

Factory.define :thanker do |thanker|
  thanker.name                   "thanker name"
  thanker.email                  "thanker.name@gmail.com"
  thanker.subdomain              "testthanker"
  thanker.password               "foobar"
  thanker.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.sequence :subdomain do |n|
  "person-subdomain-#{n}"
end

Factory.define :thankyou do |thankyou|
  thankyou.content "Foo bar"
  thankyou.headline "baz quuux"
end

