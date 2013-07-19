class CreateMercibokus < ActiveRecord::Migration
  def change
    create_table :mercibokus do |t|
      t.integer :thanker_id
      t.integer :welcomer_id
      t.text    :content

      t.timestamps
    end

    add_index :mercibokus, :thanker_id
    add_index :mercibokus, :welcomer_id
    add_index :mercibokus, [:thanker_id, :welcomer_id]
  end
end

