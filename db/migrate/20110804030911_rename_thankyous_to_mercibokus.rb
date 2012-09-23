class RenameThankyousToMercibokus < ActiveRecord::Migration
  def up
    rename_table("thankyous", "mercibokus")
  end


  def down
    rename_table("mercibokus", "thankyous")
  end
end
