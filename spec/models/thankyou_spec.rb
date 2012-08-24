require 'spec_helper'

describe Thankyou do

  describe "instantiation" do 
    let(:thankyou) { Thankyou.new }
    
    it "should be of type class" do 
      Thankyou.should be_kind_of(Class)
    end
    
    it "should not be validout of the box" do
      thankyou.should_not be_valid
    end
  end

  describe "validations" do
    it { should validate_presence_of :thanker_id }
    it { should validate_presence_of :welcomer_id }
  end

  describe "associations" do 
    it { should belong_to :thanker }
    it { should belong_to :welcomer }
    it { should have_many :attachments }

  end

  describe "methods" do 
    it { should respond_to :thanker }
    it { should respond_to :welcomer }
  end

#   before(:each) do
#     # let(:thanker) { Factory.create(:user) }
#     # @thanker  = Factory(:user)
#     # @welcomer = Factory(:user, :email => Factory.next(:email),
#     #                          :name  => Factory.next(:name),
#     #                          :subdomain => Factory.next(:subdomain))
#     # @thankyou = @thanker.thankyous.build(:welcomer_id => @welcomer.id,
#     #                                    :content => "content",
#     #                                    :headline => "headline")
#   end 
# end

#   it "should create a new instance given valid attributes" do
#     @thankyou.save!
#   end

#   describe "thanking methods" do

#     before(:each) do
#       @thankyou.save
#     end

#     it "should have a thanker attribute" do
#       @thankyou.should respond_to(:thanker)
#     end

#     it "should have the correct thanker" do
#       @thankyou.thanker.should == @thanker
#       @thankyou.thanker_id.should == @thanker.id
#     end

#     it "should have a welcomer attribute" do
#       @thankyou.should respond_to(:welcomer)
#     end

#     it "should have the right welcomer user" do
#       @thankyou.welcomer.should == @welcomer
#     end
#   end

#   describe "validations" do

#     it "should require a thanker_id" do
#       @thankyou.thanker_id = nil
#       @thankyou.should_not be_valid
#     end

#     it "should require a welcomer_id" do
#       @thankyou.welcomer_id = nil
#       @thankyou.should_not be_valid
#     end

#     it "should require some kind of content" do
#       @thankyou.content = nil
#       @thankyou.should_not be_valid
#     end

#     it "should require a headline" do
#       @thankyou.headline = nil
#       @thankyou.should_not be_valid
#     end
#   end
end