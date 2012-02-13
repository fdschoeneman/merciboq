namespace :db do
  desc "Fill database with sample data" 
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    sample_admin
    make_users
    make_thankyous
    make_welcomes
  end
end

def sample_admin
  admin = User.new( :name => "admin",
                    :email => "admin@merciboq.com",
                    :password => "password" )
  admin.save!
  admin.confirm!
  admin.toggle!(:admin)
end

def make_users
  99.times do |n|
    email = Faker::Internet.email
    password  = "password"
    user = User.new(:email => email,
                    :password => password)  
    user.save!
    user.confirm!
  end
end

#def make_thankyous
#  user = User.first
#  50.times do |n|
#    user.thankyous.create!(:content => Faker::Company.bs,
#                           :headline => Faker::Company.catch_phrase,
#                           :welcomer_id => n+1)
#  end
#end

def make_welcomes
  User.all[2..50].each do |user|
    user.thankyous.create!( :content => Faker::Company.bs,
                            :headline => Faker::Company.catch_phrase,
                            :welcomer_id => 1)
  end
end

def make_thankyous
  50.times do |n|
    users = User.all(:limit => 4).each do |user|
      welcomer = n+1
      headline = Faker::Company.catch_phrase
      content = Faker::Company.bs
      thankyou = user.thankyous.create!(:welcomer_id => welcomer,
                             :content => content,
                             :headline => headline)
      thankyou.attachments << Attachment.new(:mimetype =>
  "text/plain", :filename => "foo.txt", :bytes => "Fred is the man!
 \nrecognize, bitches!")
    end
  end
end

