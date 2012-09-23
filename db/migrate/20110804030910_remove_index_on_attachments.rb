class RemoveIndexOnAttachments < ActiveRecord::Migration
  def up
    remove_index  :attachments, name: "index_attachments_on_thankyou_id_and_filename_and_id"
  end

  def down
    add_index :attachments, [:thankyou_id,:filename,:id]
  end

end
