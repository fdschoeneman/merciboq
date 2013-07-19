class AddHeadlineToMercibokus < ActiveRecord::Migration
  def change
    add_column :mercibokus, :headline, :text
  end
end

