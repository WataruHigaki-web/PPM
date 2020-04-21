# frozen_string_literal: true

class ModifyColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :status, from: false, to: true
  end
end
