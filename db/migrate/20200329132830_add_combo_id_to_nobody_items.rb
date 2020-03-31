class AddComboIdToNobodyItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :nobody_items, :combo, foreign_key: true
  end
end
