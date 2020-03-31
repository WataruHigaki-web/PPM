class AddProductToNobodyItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :nobody_items, :product, foreign_key: true
  end
end
