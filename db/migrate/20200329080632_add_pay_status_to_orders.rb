class AddPayStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pay_status, :boolean, default: false, null: false
  end
end
