require 'factory_girl'

Factory.define :user do |user|
  user.name                   "test name"
  user.email                  "test.name@gmail.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :thankyou do |thankyou|
  thankyou.content "Foo bar"
  thankyou.association :user
end

