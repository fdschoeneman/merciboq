class AddIndextoUserSubdomain < ActiveRecord::Migration
  def up
    add_index :users, :subdomain, :unique => true
  end

  def down
    remove_index :users, :subdomain
  end
end

