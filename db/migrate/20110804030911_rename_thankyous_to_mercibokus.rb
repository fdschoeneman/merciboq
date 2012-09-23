class RenameThankyousToMercibokus < ActiveRecord::Migration
  class Mercibokus < ActiveRecord::Base
  end

  def up
    rename_table("thankyous", "mercibokus")
  end


  def down
    rename_table("mercibokus", "thankyous")
  end
end
