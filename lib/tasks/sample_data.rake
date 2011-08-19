namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_admin_user
    make_users
    make_welcomes
#    make_thankyous
  end
end

def make_admin_user
  user = User.new(:name => "Fred Schoeneman",
                  :email => "fred.schoeneman@gmail.com",
                  :password => "password",
                  :password_confirmation => "password"
                  )
  user.skip_confirmation!
  user.save
  user.confirm!
end

def make_users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@merciboq.org"
    password  = "password"
    user = User.new(:name => name,
                    :email => email,
                    :password => password,
                    :password_confirmation => password
                    )
    user.skip_confirmation!
    user.save
    user.confirm!
  end
end

def make_welcomes
  User.all(:limit => 50).each do |user|
    user.thankyous.create!(:content => Faker::Company.catch_phrase, :headline => Faker::Company.bs, :welcomer_id => 1)
  end
end

#def make_thankyous
#  user = User.first
#  users = User.all(:limit => 50)
#  user.thank!(:welcomer => users, :)
#end

