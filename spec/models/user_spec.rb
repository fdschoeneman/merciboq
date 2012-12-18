require 'spec_helper'

describe User do

  describe 'database' do 

    describe 'columns' do 

      %w[reset_password_sent_at remember_created_at current_sign_in_at 
        last_sign_in_at confirmed_at confirmation_sent_at 
        created_at updated_at
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end
      
      %w[email encrypted_password 
        reset_password_token current_sign_in_ip last_sign_in_ip
        confirmation_token unconfirmed_email reconfirmable name 
        subdomain business_name address_1 address_2 phone city state 
        zip_code web_address hours_of_operation public_email 
        welcome_phrase thankyou_phrase calendar
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:string) }
      end

      it { should have_db_column(:sign_in_count).of_type(:integer) }
      it { should have_db_column(:admin).of_type(:boolean) }

    end

    describe 'indexes' do 

      %w[confirmation_token email reset_password_token subdomain
      ].each do |index|
        it { should have_db_index(index.to_sym).unique(true)}
      end
    end
  end

  describe "security" do

    describe "mass assignable" do 

      %w[name email subdomain password password_confirmation
        remember_me welcome_phrase thankyou_phrase calendar
      ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe "protected" do 

      %w[user_id admin encrypted_password reset_password_token 
        reset_password_sent_at remember_created_at unconfirmed_email 
        reconfirmable sign_in_count current_sign_in_at last_sign_in_at
        confirmation_token confirmed_at confirmation_sent_at 
        unconfirmed_email submissive_id
      ].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do

    before(:each) { FactoryGirl.create(:user) }
    
    describe "email" do 

      it { should validate_presence_of(:email)
        .with_message(/can't be blank/) }
      it { should validate_uniqueness_of(:email)
        .with_message(/already been registered/) }
    
      it "should allow properly formed emails" do 
        ["fred@test.com", "pat@gmail.com", "user.period@yahoo.com", 
          "user_underscore@msn.hotmail.com"
        ].each do |good_email|
          should allow_value(good_email).for(:email) 
        end
      end

      it "should disallow bad emails" do 
        ["fre_d@.com", "@gmail.com", "hotmail.com", "gmail", 
          "super#.fly@gmail.com", "net&@gmail.com"
        ].each do |bad_email|
          should_not allow_value(bad_email).for(:email) 
        end
      end
    end

    describe "password" do 

      it "should be more than 5 and less than 41 characters long" do 
        should_not allow_value("a" * 41).for(:password) 
        should_not allow_value("a" * 5).for(:password) 
        should allow_value("a" * 40).for(:password) 
        should allow_value("a" * 6).for(:password) 
      end
    end

    describe "subdomain" do 

      it "should accept valid subdomains" do
        ["SuBDomain", "subdomain", "subdomain-with-dashes", "su830ma1n-w174-num3rs", 
          "3u8d0ma1n-s7ar71ng-with-num3rs"
        ].each do |valid_subdomain|
          should allow_value(valid_subdomain).for(:subdomain) 
        end
      end

      it "should not accept bad subdomains" do 

        ["sub domain with spaces", "subdomain_with_non_ascii%$#"
        ].each do |bad_subdomain|
          should_not allow_value(bad_subdomain).for(:subdomain)
        end
      end
              
      it "should not allow reserved subdomains" do 
        %w[ support blog www billing help api merciboku privacy help legal terms blog
        ].each do |reserved_subdomain|
          should_not allow_value(reserved_subdomain).for(:subdomain) #.with_message(/reserved and unavailable/) 
        end
      end  
    end
  end

  describe "associations" do

    describe "with merciboku model" do

      [:welcomes, :thankyous
      ].each do |model|
        it { should have_many(model).class_name("Merciboku") }
      end

      it { should have_many(:thanked).through(:thankyous) }
      it { should have_many(:welcomed).through(:welcomes) }
    end

    describe "with bond model" do 

      it { should have_many(:subordinate_bonds).dependent(:destroy) }
      it { should have_many(:dominants).through(:subordinate_bonds) }
      it { should have_many(:dominant_bonds).dependent(:destroy) }
      it { should have_many(:subordinates).through(:dominant_bonds) }
    end
  end
  
  describe "methods" do 

    describe "on merciboku model" do 

      it { should respond_to(:thanked) }
      it { should respond_to(:welcomed) }
    end

    describe "on bond model" do 

      it { should respond_to(:subordinates) }
      it { should respond_to(:dominants) }
      it { should respond_to(:subordinate_to?) }
      it { should respond_to(:submit!) }      
      
      Given(:subordinate_user) { FactoryGirl.create(:subordinate) }
      Given(:dominant_user) { FactoryGirl.create(:dominant) }

      describe "creating a bond" do
        
        When { subordinate_user.submit!(dominant_user) }
        Then { subordinate_user.should be_subordinate_to(dominant_user) }
        Then { subordinate_user.dominants.should include(dominant_user)}
        
        describe "and then destroying the same bond" do
          When  { subordinate_user.emancipate!(dominant_user) }
          Then  { dominant_user.subordinates.should_not include(subordinate_user) }
        end
      end
    end
  end
end
