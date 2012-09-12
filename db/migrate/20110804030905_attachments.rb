class Attachments < ActiveRecord::Migration
  def up
    create_table :attachments do |t|
      t.integer :merciboku_id # foreign key
      t.string :filename     # "cuddly_bunny.jpg"
      t.string :mimetype     # "image/jpeg"
      t.integer :bytecount   # file size
      t.binary :bytes        # the bytes of the file
    end

    add_index :attachments, [:merciboku_id,:filename,:id]
  end

  def down
    drop_table :attachments
  end
end

