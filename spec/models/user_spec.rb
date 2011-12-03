require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

#  describe "password validations" do

#    it "should require a password" do
#      User.new(@attr.merge(:password => "", :password_confirmation => "")).
#        should_not be_valid
#    end

#    it "should require a matching password confirmation" do
#      User.new(@attr.merge(:password_confirmation => "invalid")).
#        should_not be_valid
#    end

#    it "should reject short passwords" do
#      short = "a" * 5
#      hash = @attr.merge(:password => short, :password_confirmation => short)
#      User.new(hash).should_not be_valid
#    end

#    it "should reject long passwords" do
#      long = "a" * 41
#      hash = @attr.merge(:password => long, :password_confirmation => long)
#      User.new(hash).should_not be_valid
#    end
#  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end

  describe "thankyous" do

    before(:each) do
      @user = User.create!(@attr)
      @welcomer = Factory(:user)
      content = "content_for_thankyou"
      headline = "headline_for_thankyou"
      @attr = { :content => "lorem ipsum" }
    end

    it "should have a thankyous method" do
      @user.should respond_to(:thankyous)
    end

    it "should have a thanked method" do
      @user.should respond_to(:thanked)
    end

    it "should have a thanked? method" do
      @user.should respond_to(:thanked?)
    end

    it "should have a thank! method" do
      @user.should respond_to(:thank!)
    end

    it "should have a welcomes method" do
      @user.should respond_to(:welcomes)
    end

    it "should have a welcomed method" do
      @user.should respond_to(:welcomed)
    end
  end

  describe "admin attribute" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should respond to admin" do
      @user.should respond_to(:admin)
    end

    it "should not be an admin by default" do
      @user.should_not be_admin
    end

    it "should be convertible to an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end
end

