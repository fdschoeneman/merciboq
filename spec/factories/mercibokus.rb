FactoryGirl.define do 

  factory :merciboku do 
    association :thanker,   factory: :thanker
    association :welcomer,  factory: :welcomer
    content "Foo bar"
    headline "baz quuux"
  end
end