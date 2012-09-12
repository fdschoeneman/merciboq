require 'spec_helper'

describe Merciboku do

  let(:merciboku) { build(:merciboku) }
    
  describe "instantiation" do 
    
    it "should be of type class" do 
      Merciboku.should be_kind_of(Class)
    end
    
    it "should have a valid factory" do
      merciboku.should be_valid
    end
  end

  describe "table structure" do
    it { should have_db_column(:thanker_id) }
    it { should have_db_column(:welcomer_id) }
    it { should have_db_column(:content) }
    it { should have_db_column(:headline) }
    it { should have_db_index(:thanker_id) }
    it { should have_db_index(:welcomer_id) }
    it { should have_db_index([:thanker_id, :welcomer_id]) }
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
end
