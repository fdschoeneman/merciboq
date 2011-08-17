class AddHeadlineToThankyous < ActiveRecord::Migration
  def change
    add_column :thankyous, :headline, :string
  end
end
