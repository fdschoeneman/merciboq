require 'spec_helper'

describe Bond do
    
  describe "database" do

    describe "columns" do 
  
      it { should have_db_column(:subordinate_id).of_type(:integer) }
      it { should have_db_column(:dominant_id).of_type(:integer) }
    end

    describe "indexes" do 

      [:subordinate_id, :dominant_id].each do |index|
        it { should have_db_index(index) }
      end
  
      it { should have_db_index([:subordinate_id, :dominant_id]).unique(true) }
    end
  end

  describe "validations" do 
    it { should validate_presence_of :subordinate_id }
    it { should validate_presence_of :dominant_id }
  end

  describe "associations" do 
    it { should belong_to :subordinate }
    it { should belong_to :dominant }
  end

  describe "methods" do 
    it { should respond_to(:subordinate) }
    it { should respond_to(:dominant) }
  end
end
