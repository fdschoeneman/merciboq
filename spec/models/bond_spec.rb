require 'spec_helper'

describe Bond do
  
  before(:each) do
    @submissive = Factory(:user)
    @dominant = Factory(:user, email: Factory.next(:email))
    
    @bonds = @submissive.bonds.build(dominant_id: @dominant.id)
  end
    
  describe "instantiation" do
    
    it "should create a new instance given valid attributes" do
      @bond.save!
    end 
  end
end
