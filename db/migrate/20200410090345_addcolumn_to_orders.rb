# frozen_string_literal: true

class AddcolumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :discount_id, :integer
  end
end
