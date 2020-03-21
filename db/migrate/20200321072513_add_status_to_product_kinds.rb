class AddStatusToProductKinds < ActiveRecord::Migration[5.2]
  def change
    add_column :product_kinds, :status, :boolean, default: false, null: false
  end
end
