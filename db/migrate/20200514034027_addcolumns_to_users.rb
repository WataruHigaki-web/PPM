class AddcolumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
    add_column :users, :address_building, :string
  end
end
