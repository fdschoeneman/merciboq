class ChangeSubmissiveToSubordinate < ActiveRecord::Migration
  def up

    change_table :bonds do |t|
      t.rename :submissive_id, :subordinate_id
    end
    remove_index :bonds, :submissive_id
    remove_index :bonds, [:submissive_id, :dominant_id]

    add_index :bonds, :subordinate_id
    add_index :bonds, [:subordinate_id, :dominant_id], unique: true 
  end

  def down
  end
end
