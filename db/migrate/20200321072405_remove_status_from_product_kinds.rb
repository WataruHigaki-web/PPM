class RemoveStatusFromProductKinds < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_kinds, :status, :integer
  end
end
