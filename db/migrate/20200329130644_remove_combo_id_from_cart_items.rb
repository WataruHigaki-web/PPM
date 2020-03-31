class RemoveComboIdFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cart_items, :combo_item, foreign_key: true
  end
end
