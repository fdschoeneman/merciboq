class ChangeSubmissiveToSubordinate < ActiveRecord::Migration
  def up

    change_table :bonds do |t|
      t.rename :submissive_id, :subordinate_id
    end
  end

  def down
  end
end
