class AddAddressToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :postal_code, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address_line1, :string, null: false
    add_column :users, :address_line2, :string, null: false
    add_column :users, :phone_number, :string, null: false
  end
end
