# frozen_string_literal: true

class AddIsDeletedToUSers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
