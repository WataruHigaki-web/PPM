# frozen_string_literal: true

class AddPointEventIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :point_event_id, :integer
  end
end
