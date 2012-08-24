class CreateBonds < ActiveRecord::Migration
  def change
    create_table :bonds do |t|
      t.integer   :submissive_id
      t.integer   :dominant_id

      t.timestamps
    end
    
    add_index :bonds, :submissive_id
    add_index :bonds, :dominant_id
    add_index :bonds, [:submissive_id, :dominant_id], unique: true
  end
end
