class RenameThankyousToMercibokus < ActiveRecord::Migration
  def up
    rename_table("Thankyous", "Mercibokus")
  end


  def down
    rename_table("mercibokus", "thankyous")
  end
end