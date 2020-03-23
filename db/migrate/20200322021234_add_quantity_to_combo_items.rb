class AddQuantityToComboItems < ActiveRecord::Migration[5.2]
  def change
    add_column :combo_items, :quantity, :integer
  end
end
