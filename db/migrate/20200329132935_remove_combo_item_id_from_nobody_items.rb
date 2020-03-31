class RemoveComboItemIdFromNobodyItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :nobody_items, :combo_item, foreign_key: true
  end
end
