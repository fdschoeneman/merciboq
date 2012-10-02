class AddIndexOnWelcomesAndThankyousToMercibokus < ActiveRecord::Migration
  def change
    add_index :mercibokus, [:welcomer_id, :thanker_id]
  end
end
