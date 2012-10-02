require 'spec_helper'

describe ThankyouByEmailController do
  
  thankyou_note = Mail.new do 

    from "Frommy McFrommerton <frommy.mcfrommerton@unregistered.com>"
    to ["toohey.receivesalot@unregistered.com", "toohey_comrade@unregistered.com", 
      "333581f1ce6f4de6207a@cloudmailin.net", 
      "2009zinfandel@ferringtonvineyard.merciboq.com"
    ]
    cc "like_a_boss@unregistered.com"
    subject 'subject of an email goes to headline'
    body 'body of an email goes to content'

    text_part do
      body 'Here is the attachment you wanted'
    end

    html_part do
      content_type 'text/html; charset=UTF-8'
      body '<h1>Funky Title</h1><p>Here is the attachment you wanted</p>'
    end
  end
  
  let(:merciboqs) { Merciboku.all(limit: 2) }
  let(:sender) { User.find_by_email(thankyou_note.from) }
  let(:first_recipient) { User.find_by_email(thankyou_note.to[0])}  
  let(:second_recipient) { User.find_by_email(thankyou_note.to[1])}
  let(:new_users) { User.all }
  let(:internal_address) { 
    User.find_by_email("333581f1ce6f4de6207a@cloudmailin.net") }
  let(:merciboq_address) { 
    User.find_by_email("2009zinfandel@ferringtonvineyard.merciboq.com") }
  let(:registered_sender) { User.create(email: "registered@sender.com") }
  let(:registered_recipient) { User.create(email: "registered@recipient.com") }     
  
  before do
    registered_recipient
    registered_sender
  end

  context "unregistered sender and two unregistered recipients" do
      
    before do
      post :create, message: thankyou_note
    end

    describe "user creation" do 
 
      it "should not create an account for an internal address" do
        internal_address.should_not be_present
        internal_address.should be nil 
      end

      it "should not create an account for a user's merciboq.com address" do 
        merciboq_address.should_not be_present
      end

      xit "should notify sender if a user's merciboq.com address doesn't exist" do
      end

      it "should have an account" do 
        new_users.each do |user|
          user.should be_present
          user.should_not be_nil
        end
      end

      describe "should have temporary name which" do 
        
        it "should not be blank" do 
          new_users.each do |user| 
            user.name.should_not be_blank
          end
        end

        it "should replace periods and underscores with spaces" do
          sender.name.should_not eq("Frommy.Mcfrommerton")  
          first_recipient.name.should_not eq("Toohey.teceivesalot")
          second_recipient.name.should_not eq("Toohey_Comrade")
        end

        it "should have capitalized first and last names" do
          sender.name.should eq("Frommy Mcfrommerton")
          first_recipient.name.should eq("Toohey Receivesalot")
          second_recipient.name.should eq("Toohey Comrade")
        end
      end

      describe "subdomain" do 
        
        it "should not be blank" do
          new_users.each do |user|
            user.subdomain.should_not be_blank
          end
        end

        it "should contain elements from the user's name" do
          sender.subdomain.should =~ /frommy-mcfrommerton/
          first_recipient.subdomain.should =~ /toohey-receivesalot/
          second_recipient.subdomain.should =~ /toohey-comrade/
        end
      end
    end
  
    describe "merciboq creation" do
      
      it "should result in two merciboqs" do
        Merciboku.count.should eq 2
        Merciboku.count.should_not eq 3
      end

      describe "each" do
        
        it "should take the thanker from the sender" do 
          merciboqs.each do |merciboq|
            merciboq.thanker_id.should eq sender.id 
          end
        end

        it "should take the welcomer from one of the recipients" do 
          merciboqs.last.welcomer_id.should eq first_recipient.id
          merciboqs.first.welcomer_id.should eq second_recipient.id
        end

        it "should take the headline from the email subject" do 
          merciboqs.each do |merciboq|
            merciboq.headline.should =~ /subject of an email/
          end
        end

        it "should take the content from the email body" do 
          merciboqs.each do |merciboq|
            merciboq.content.should =~ /body of an email/
          end  
        end  
      end
    end

    describe "notification emails" do 
      include Mail::Matchers

      # ThankyouMailer.should_receive(:thankyou_notifier).with("email@example.com", "Jimmy Bean")
      # last_delivery = ActionMailer::Base.deliveries.last
      
      it "should have an email" do 
        ActionMailer::Base.deliveries.count.should eq 1
      end# last_delivery.to.should include "email@example.com"
      it { should have_sent_email }
    end
  end

  context "unregistered sender and 1 unregistered recipient" do 
    
    before do 
      thankyou_note.from = "unregistered@sender.com"
      thankyou_note.to = ["unregistered@recipient.com", "thanks@merciboq.com"]
    end

    it "should create 2 new users" do
      expect{post :create, message: thankyou_note}.to change(User, :count).by(2)
    end

    it "should create 1 new merciboq" do 
      expect{post :create, message: thankyou_note}.to change(Merciboku, :count).by(1)
    end
  end

  context "unregistered sender and 1 registered recipient" do 
    
    before do 
      registered_recipient
      thankyou_note.from = "unregistered@sender.com"
      thankyou_note.to = ["registered@recipient.com", "thanks@merciboq.com"]
    end

    it "should create 1 new user" do
      expect{post :create, message: thankyou_note}.to change(User, :count).by(1)
    end

    it "should create 1 new merciboq" do 
      expect{post :create, message: thankyou_note}.to change(Merciboku, :count).by(1)
    end
  end

  context "registered sender and 1 unregistered recipient" do 

    before do 
      thankyou_note.from = "registered@sender.com"
      thankyou_note.to = ["unregistered@recipient.com", 
        "registered@recipient.com", "thanks@merciboq.com"
      ]
    end
    
    it "should create 1 new user" do
      expect{post :create, message: thankyou_note}.to change(User, :count).by(1)
    end

    it "should create 2 new merciboqs" do
      expect{post :create, message: thankyou_note}.to change(Merciboku, :count).by(2)    
    end
  end
  
  context "registered sender and 1 registered recipient" do 
    
    before do 
      thankyou_note.from = "registered@sender.com"
      thankyou_note.to = ["registered@recipient.com", "thanks@merciboq.com"]
    end

    it "should not create any new users" do
      expect{post :create, message: thankyou_note}.to change(User, :count).by(0)
    end

    it "should create 1 new merciboq" do 
      expect{post :create, message: thankyou_note}.to change(Merciboku, :count).by(1)
    end
  end
end