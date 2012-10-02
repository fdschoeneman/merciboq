require 'spec_helper'

describe Bond do
    
  describe "instantiation" do
    let(:bond) { Bond.new }

    it "should be a type of class" do
      Bond.should be_kind_of Class
    end 
  end

  describe "database" do

    describe "columns" do 
  
      it { should have_db_column(:submissive_id).of_type(:integer) }
      it { should have_db_column(:dominant_id).of_type(:integer) }
    end

    describe "indexes" do 

      [:submissive_id, :dominant_id].each do |index|
        it { should have_db_index(index) }
      end
  
      it { should have_db_index([:submissive_id, :dominant_id]).unique(true) }
    end
  end

  describe "validations" do 
    it { should validate_presence_of :submissive_id }
    it { should validate_presence_of :dominant_id }
  end

  describe "security" do 

    describe "mass assignable" do 

      it { should allow_mass_assignment_of(:dominant_id) }
      it { should allow_mass_assignment_of(:submissive_id)}
    end

    describe "protected" do 

    end
  end
end
