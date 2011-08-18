namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_thankyous
  end
end

def make_users
  User.create!(:name => "Fred Schoeneman",
               :email => "fred.schoeneman@gmail.com",
               :password => "password",
               :password_confirmation => "password").confirm!
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_thankyous
  User.all(:limit => 50).each do |user|
    user.thankyous.create!(:content => Faker::Company.catch_phrase, :headline => Faker::Company.bs, :welcomer_id => 1)
  end
end


#def make_thankyous
#  users = User.all
#  user  = users.first
#  thanked = users[1..50]
#  welcomed = users[3..40]
#  thanked.each { |welcomer| user.thank!(welcomer,
#                  :content => Faker::Lorem.sentence(5))  }
#  welcomed.each { |thanker| thanker.thank!(user) }
# end

