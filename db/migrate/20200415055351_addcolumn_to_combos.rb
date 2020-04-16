# frozen_string_literal: true

class AddcolumnToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :introduction, :text
    add_column :combos, :status, :boolean, default: false, null: false
  end
end
