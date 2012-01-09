namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    #Rake::Task['db:migrate'].invoke
    sample_fred
    sample_nixon
    sample_lenny
    make_users
    make_thankyous
    make_welcomes
  end
end

def sample_fred
  user = User.new(:name => "Fred Schoeneman",
                  :subdomain => "fred-schoeneman",
                  :email => "fred.schoeneman@gmail.com",
                  :password => "password",
                  :password_confirmation => "password"
                  )
  user.skip_confirmation!
  #user.toggle!(:admin)
  user.save
  user.confirm!
end

def sample_nixon
  user = User.new(:name => "Nicole Henderson",
                  :subdomain => "hola.nicole",
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
                  :subdomain => "sweetleonster",
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
    downcased_name = name.downcase
    subdomain = "#{downcased_name.split(' ').join('-')}"
    email = "#{downcased_name.split(' ').join('-')}@example.com"
    password  = "password"
    user = User.new(:name => name,
                    :subdomain => subdomain,
                    :email => email,
                    :password => password,
                    :password_confirmation => password
                    )
    user.skip_confirmation!
    user.save
    user.confirm!
  end
end

#def make_thankyous
#  50.times do |n|
#    users = User.all(:limit => 4).each do |user|
#      welcomer = n+1
#      headline = Faker::Company.catch_phrase
#      content = Faker::Company.bs
#      thankyou = user.thankyous.create!(:welcomer_id => welcomer,
#                             :content => content,
#                             :headline => headline)
#      thankyou.attachments << Attachment.new(:mimetype => "text/plain", :filename => "foo.txt", :bytes => "Fred is the man!\nrecognize, bitches!")
#    end
#  end
#end

def make_thankyous
  user = User.first
  50.times do |n|
    user.thankyous.create!(:content => Faker::Company.bs,
                           :headline => Faker::Company.catch_phrase,
                           :welcomer_id => n+1)
  end
end

def make_welcomes
  User.all[2..50].each do |user|
    user.thankyous.create!( :content => Faker::Company.bs, 
                            :headline => Faker::Company.catch_phrase, 
                            :welcomer_id => 1)
  end
end

