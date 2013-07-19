require 'spec_helper'

describe ThankyouByEmailController do
  
  before(:each) do
    Mail::TestMailer.deliveries.clear  
    previously_registered_sender
    previously_registered_recipient
  end

  context "unregistered sender and two unregistered recipients" do
      
    let(:us2ur_msg) { thankyou_note }
    let(:sender) { User.find_by_email(us2ur_msg.from) }
    let(:first_recipient) { User.find_by_email(us2ur_msg.to[0])}  
    let(:second_recipient) { User.find_by_email(us2ur_msg.to[1])}
    let(:new_users) { User.all }
    
    before do
      post :create, message: us2ur_msg
    end

    describe "user creation" do 
      
      let(:internal_address) { 
        User.find_by_email("333581f1ce6f4de6207a@cloudmailin.net") }
      let(:merciboq_address) { 
        User.find_by_email("2009zinfandel@ferringtonvineyard.merciboq.com") }
          
      it "should not create an account for an internal address" do
        internal_address.should_not be_present
      end

      it "should not create an account for a user's merciboq.com address" do 
        merciboq_address.should_not be_present
      end

      it "should notify sender if a user's merciboq.com address doesn't exist" do
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
      end

      describe "each" do
    
        let(:merciboqs) { Merciboku.all }
        
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
      
      # it "should have an email" do 
      #   ActionMailer::Base.deliveries.count.should eq 1
      # end# last_delivery.to.should include "email@example.com"
      it { should have_sent_email }
    end
  end

  let(:previously_registered_sender) { User.create(email: "registered@sender.com") }
  let(:previously_registered_recipient) { User.create(email: "registered@recipient.com") }
  
  context "unregistered sender and 1 unregistered recipient" do 
    
    let(:us1ur_msg) { thankyou_note }

    before do
      us1ur_msg.from = "unregistered@sender.com"
      us1ur_msg.to = ["unregistered@recipient.com", "thanks@merciboq.com"]
    end

    it "should create 2 new users" do
      expect{
        post :create, message: @message}.to change(User, :count).by(2)
    end

    it "should create 1 new merciboq" do 
      expect{ post :create, message: @message }.to change(Merciboku, :count).by(1)
    end
  end
  
  context "unregistered sender and 1 registered recipient" do 

    let(:us1r_msg) { thankyou_note }
    
    before do 
      us1r_msg.to = ["registered@recipient.com", "thanks@merciboq.com"]
      us1r_msg.from = "unregistered@sender.com"
    end

    it "should create 1 new user" do
      expect{post :create, message: us1r_msg}.to change(User, :count).by(1) 
    end

    it "should create 1 new merciboq" do 
      expect{
        post :create, message: us1r_msg}.to change(Merciboku, :count).by(1)
    end
  end

  context "registered sender and 1 unregistered recipient 
    and 1 registered recipient" do 

    let(:rs1ur1rr_msg) { thankyou_note }
    
    before(:each) do 
      rs1ur1rr_msg.from "registered@sender.com"
      rs1ur1rr_msg.to = ["unregistered@recipient.com", 
        "registered@recipient.com", "thanks@merciboq.com"
      ]
    end
    
    it "should create 1 new user" do
      expect{post :create, message: @message}.to change(User, :count).by(1)
    end

    it "should create 2 new merciboqs" do
      expect{post :create, message: @message}.to change(Merciboku, :count).by(2)    
    end
  end
  
  context "registered sender and 1 registered recipient" do 

    let(:rs1rr_msg) { thankyou_note }
    
    before(:each) do
      rs1rr_msg.from = "registered@sender.com"
      rs1rr_msg.to = ["registered@recipient.com", "thanks@merciboq.com"]
    end

    it "should not create any new users" do
      expect{post :create, message: @message}.to change(User, :count).by(0)
    end

    it "should create 1 new merciboq" do 
      expect{post :create, message: @message}.to change(Merciboku, :count).by(1)
    end
  end
end