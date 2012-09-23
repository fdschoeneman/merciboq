class RenameAttachmentsThankyouIdToMercibokuId < ActiveRecord::Migration
  def change
    rename_column :attachments, :thankyou_id, :merciboku_id
  end
end
