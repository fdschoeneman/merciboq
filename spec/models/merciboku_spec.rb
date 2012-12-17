require 'spec_helper'

describe Merciboku do

  let(:merciboku) { build(:merciboku) }
    
  describe "database" do

    describe "columns" do 

      [:created_at, :updated_at].each do |column|
        it {should have_db_column(column).of_type(:datetime) }
      end

      [:thanker_id, :welcomer_id].each do |column|
        it {should have_db_column(column).of_type(:integer) }
      end

      [:content, :headline].each do |column|
        it { should have_db_column(column).of_type(:text) }
      end
    end

    describe "indexes" do 

      [:thanker_id, :welcomer_id, 
        [:thanker_id, :welcomer_id], 
        [:welcomer_id, :thanker_id]
      ].each do |index|
        it { should have_db_index(index) }
      end
    end
  end

  describe "security" do 

    describe "mass assignable" do 
      [:content, :headline, :thanker_id, :welcomer_id].each do |attribute|
        it { should allow_mass_assignment_of(attribute) }
      end
    end

    describe "protected" do 
      [:created_at, :updated_at].each do |attribute|
        it { should_not allow_mass_assignment_of(attribute) }
      end
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
end
