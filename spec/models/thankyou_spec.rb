require 'spec_helper'

describe Thankyou do

  before(:each) do
    @thanker  = Factory(:user)
    @welcomer = Factory(:user, :email => Factory.next(:email),
                               :name  => Factory.next(:name),
                               :subdomain => Factory.next(:subdomain))
    @thankyou = @thanker.thankyous.build(:welcomer_id => @welcomer.id,
                                         :content => "content",
                                         :headline => "headline")
  end

  it "should create a new instance given valid attributes" do
    @thankyou.save!
  end

  describe "thanking methods" do

    before(:each) do
      @thankyou.save
    end

    it "should have a thanker attribute" do
      @thankyou.should respond_to(:thanker)
    end

    it "should have the correct thanker" do
      @thankyou.thanker.should == @thanker
      @thankyou.thanker_id.should == @thanker.id
    end

    it "should have a welcomer attribute" do
      @thankyou.should respond_to(:welcomer)
    end

    it "should have the right welcomer user" do
      @thankyou.welcomer.should == @welcomer
    end
  end

  describe "validations" do

    it "should require a thanker_id" do
      @thankyou.thanker_id = nil
      @thankyou.should_not be_valid
    end

    it "should require a welcomer_id" do
      @thankyou.welcomer_id = nil
      @thankyou.should_not be_valid
    end

    it "should require some kind of content" do
      @thankyou.content = nil
      @thankyou.should_not be_valid
    end

    it "should require a headline" do
      @thankyou.headline = nil
      @thankyou.should_not be_valid
    end
  end
end

