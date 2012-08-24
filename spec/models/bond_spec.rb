require 'spec_helper'

describe Bond do
    
  describe "instantiation" do
    let(:bond) { Bond.new }

    it "should be a type of class" do
      Bond.should be_kind_of Class
    end 
  end

  describe "db structure" do 
    it { should have_db_column(:submissive_id).of_type(:integer) }
    it { should have_db_column(:dominant_id).of_type(:integer) }
    it { should have_db_index(:submissive_id) }
    it { should have_db_index(:dominant_id) }
    it { should have_db_index([:submissive_id, :dominant_id]).unique(true) }
  end

  describe "validations" do 
    it { should validate_presence_of :submissive_id }
    it { should validate_presence_of :dominant_id }
  end

  # end
end
