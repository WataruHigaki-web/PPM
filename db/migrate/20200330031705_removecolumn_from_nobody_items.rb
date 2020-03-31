class RemovecolumnFromNobodyItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :nobody_items, :combo, foreign_key: true
    remove_reference :nobody_items, :product, foreign_key: true
    remove_column :nobody_items, :quantity, :integer
  end
end
