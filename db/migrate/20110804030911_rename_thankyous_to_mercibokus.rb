class RenameThankyousToMercibokus < ActiveRecord::Migration
  def up
    rename_table('Thankyous', 'Mercibokus')
    rename_column :attachments, :thankyou_id, :merciboku_id
  end


  def down
  end
end
