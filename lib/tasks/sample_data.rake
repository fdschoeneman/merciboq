namespace :db do
  desc "Fill database with sample data" 
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    sample_admin
    make_users
    make_merciboqs
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
    name = Faker::Name.name 
    email = "user#{n+1}@merciboq.com"
    password  = "password"
    user = User.new(name: name,
                    :email => email,
                    :password => password)  
    user.save!
    user.confirm!
  end
end

def make_merciboqs
  50.times do |n|
    users = User.all(:limit => 4).each do |user|
      welcomer = n+1
      headline = Faker::Company.catch_phrase
      content = Faker::Company.bs
      merciboq = user.thankyous.create!(:welcomer_id => welcomer,
                             :content => content,
                             :headline => headline)
 #      merciboq.attachments << Attachment.new(:mimetype =>
 #  "text/plain", :filename => "foo.txt", :bytes => "Fred is the man!
 # \nrecognize, bitches!")
    end
  end
end

