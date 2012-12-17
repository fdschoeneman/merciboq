FactoryGirl.define do
  
  factory :bond do
    association :subordinate,  factory: :subordinate
    association :dominant,    factory: :dominant
  end
end 
