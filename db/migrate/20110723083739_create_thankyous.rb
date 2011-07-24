class CreateThankyous < ActiveRecord::Migration
  def change
    create_table :thankyous do |t|
      t.integer :thanker_id
      t.integer :welcomer_id
      t.string :content

      t.timestamps
    end

    add_index :thankyous, :thanker_id
    add_index :thankyous, :welcomer_id
    add_index :thankyous, [:thanker_id, :welcomer_id]
  end
end

