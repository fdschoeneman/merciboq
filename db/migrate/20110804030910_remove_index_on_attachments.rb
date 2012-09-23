class RemoveIndexOnAttachments < ActiveRecord::Migration
  def change
    remove_index  :attachments, name: "index_attachments_on_thankyou_id_and_filename_and_id"
    
  end

end
