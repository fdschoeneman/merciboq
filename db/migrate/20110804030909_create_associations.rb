class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :sub_id
      t.integer :dom_id

      t.timestamps
    end 
  end
end
