class AddDayToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :day, :integer
  end
end
