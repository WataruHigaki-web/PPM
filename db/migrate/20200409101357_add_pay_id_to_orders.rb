class AddPayIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pay_id, :integer
  end
end
