class AddRequirecolumnToDiscount < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :require_day, :integer
    add_column :discounts, :require_combo, :integer
    add_column :discounts, :require_item, :integer
  end
end
