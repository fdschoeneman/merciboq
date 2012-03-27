
FactoryGirl.define do
  factory :welcomer do 
    name                   "welcomer name"
    email                  "welcomer.name@gmail.com"
    subdomain              "testwelcomer"
    password               "bazquux"
    password_confirmation  "bazquux"
  end
end

FactoryGirl.define do
  factory :thanker do
    name                   "thanker name"
    email                  "thanker.name@gmail.com"
    subdomain              "testthanker"
    password               "foobar"
    password_confirmation  "foobar"
  end
end



FactoryGirl.define do 
  factory :thankyou do
    content "Foo bar"
    headline "baz quuux"
  end
end
