require 'spec_helper'

describe User do

  describe "instantiation" do
    let(:user) { User.new}

    it "should be of type class" do
      User.should be_kind_of(Class)
    end

    it "should not be valid" do
      user.should_not be_valid
    end
  end

  describe "validations" do

    before(:each) { FactoryGirl.create(:user) }
    let(:user) { FactoryGirl.create(:user) }

    # email validations
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).
              with_message(/already been registered/) }
    it { should allow_value("fred@test.com").for(:email) }
    it { should_not allow_value("fre_d@.com").for(:email) }
    it { should_not allow_value("@test.com").for(:email) }

    # password validations
    it { should_not allow_value("a" * 41).for(:password) }
    it { should_not allow_value("fr_ed@test.").for(:email) }
    it { should_not allow_value("a" * 41).for(:password) }
    it { should allow_value("a" * 40).for(:password) }
    it { should_not allow_value("a" * 5).for(:password) }
    it { should allow_value("a" * 6).for(:password) }

    # subdomain validations
    it { should_not allow_value("www").for(:subdomain).
              with_message(/reserved and unavailable/) }
    it { should allow_value("subdomain").for(:subdomain) }
    it { should allow_value("sub-domain").for(:subdomain) }
#    it { should allow_value("sub.domain").for(:subdomain) }
#    it { should_not allow_value("sub domain").for(:subdomain) }
  end

  context "associations" do
    it { should have_many(:welcomes) }
    it { should have_many(:thankyous) }
    it { should have_many(:thanked).through(:thankyous) }
    it { should have_many(:welcomed).through(:welcomes) }
  end

  describe "admin attributes" do

    let(:user) { FactoryGirl.create(:user) }

    it { should respond_to(:admin) }

    it { should_not be_admin }

    it "should be convertible to an admin" do
      user.toggle!(:admin)
      user.should be_admin
    end
  end

  # describe "DELETE 'destroy'" do
  #   before(:each) do
  #     @user = Factory(:user)
  #   end

  #   describe "as a non-signed-in user" do
  #     it "should deny access" do
  #       delete :destroy, :id => @user
  #       response.should redirect_to(signin_path)
  #     end
  #   end
  # end
end

