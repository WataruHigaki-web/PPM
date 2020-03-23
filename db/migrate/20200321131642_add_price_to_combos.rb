class AddPriceToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :price, :integer
  end
end
