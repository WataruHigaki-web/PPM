# frozen_string_literal: true

class ModifyStaryDateToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :start_date, :date
    change_column :orders, :finish_date, :date
  end
end
