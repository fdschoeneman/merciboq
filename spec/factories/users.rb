FactoryGirl.define do 
  
  factory :user do
    sequence(:name)       {|n| "username#{n}" }
    sequence(:email)      {|n| "user#{n}@test.com" }
    sequence(:subdomain)  { |n| "user-#{n}-subdomain" }
    password              "123qweasd"
    password_confirmation "123qweasd"
  end
  
end
