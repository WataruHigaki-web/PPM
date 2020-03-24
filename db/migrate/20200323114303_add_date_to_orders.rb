class AddDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :start_date, :integer
    add_column :orders, :finish_date, :integer
  end
end
