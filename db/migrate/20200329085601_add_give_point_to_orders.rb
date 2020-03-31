class AddGivePointToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :give_point, :boolean, default: false, null: false
  end
end
