class RenameThankyousToMercibokus < ActiveRecord::Migration
  class Mercibokus < ActiveRecord::Base
  end

  def up
    rename_table("Thankyous", "Mercibokus")
  end


  def down
    rename_table("mercibokus", "thankyous")
  end
end
