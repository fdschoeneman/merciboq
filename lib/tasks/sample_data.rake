namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
#    make_admin_users
    sample_fred
    sample_jones
    sample_nixon
    sample_lenny
    make_users
    make_thankyous
    make_welcomes
  end
end

def sample_fred
  user = User.new(:name => "Fred Schoeneman",
                  :email => "fred.schoeneman@gmail.com",
                  :password => "password",
                  :password_confirmation => "password"
                  )
  user.skip_confirmation!
  user.save
  user.confirm!
end

def sample_jones
  user = User.new(:name => "Sara Jane Holditch",
                  :email => "sjholditch@gmail.com",
                  :password => "password",
                  :password_confirmation => "password"
                  )
  user.skip_confirmation!
  user.save
  user.confirm!
end

def sample_nixon
  user = User.new(:name => "Nicole Henderson",
                  :email => "hola.nicole@gmail.com",
                  :password => "password",
                  :password_confirmation => "password"
                  )
  user.skip_confirmation!
  user.save
  user.confirm!
end

def sample_lenny
  user = User.new(:name => "Lenny \"Mr Eyzerovich\" Turetsky",
                  :email => "sweetleonster@gmail.com",
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

def make_thankyous
  50.times do |n|
    users = User.all(:limit => 4).each do |user|
      welcomer = n+1
      headline = Faker::Company.catch_phrase
      content = Faker::Company.bs
      user.thankyous.create!(:welcomer_id => welcomer,
                             :content => content,
                             :headline => headline)
    end
  end
end


def make_welcomes
  headline = Faker::Company.catch_phrase
  content = Faker::Company.bs
  User.all(:limit => 50).each do |user|
    user.thankyous.create!(:content => content, :headline => headline, :welcomer_id => 1)
  end
end

#def make_thankyous
#  user = User.first
#  users = User.all(:limit => 50)
#  users.each do user.thank!(:welcomer => users, :)
#end

