class AddstaffToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :lender, :string
    add_column :orders, :receiver, :string
  end
end
