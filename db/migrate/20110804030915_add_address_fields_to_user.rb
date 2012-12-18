class AddAddressFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_name, :string
    add_column :users, :public_email, :string
    add_column :users, :hours_of_operation, :string
    add_column :users, :web_address, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
  end
end
