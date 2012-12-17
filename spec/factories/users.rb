FactoryGirl.define do 
  
  factory :user do
    sequence(:name)       {|n| "username#{n}" }
    sequence(:email)      {|n| "user#{n}@test.com" }
    sequence(:subdomain)  { |n| "user-#{n}-subdomain" }
    password              "password"
  end

  factory :thanker, parent: :user do
  end

  factory :welcomer, parent: :user do 
  end

  factory :dominant, parent: :user do
  end

  factory :subordinate, parent: :user do 
  end

end
