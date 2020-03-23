class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :zip_code, :string
    add_column :orders, :address, :string
  end
end
