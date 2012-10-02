FactoryGirl.define do 
  
  factory :user do
    sequence(:name)       {|n| "username#{n}" }
    sequence(:email)      {|n| "user#{n}@test.com" }
    sequence(:subdomain)  { |n| "user-#{n}-subdomain" }
    password              "password"
  end

  factory :thanker, parent: :user do
    name                   "Customer Bob"
    email                  "bob.the.customer@gmail.com"
    subdomain              "bob-the-customer"
    password               "password"
    password_confirmation  "password"
  end

  factory :welcomer, parent: :user do 
    name                   "bartender chad"
    email                  "bartender.chad@gmail.com"
    subdomain              "chad-the-bartender"
    password               "bazquux"
    password_confirmation  "bazquux"
  end
end
