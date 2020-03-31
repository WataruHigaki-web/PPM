class AddComboItemIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :combo_item, foreign_key: true
  end
end
