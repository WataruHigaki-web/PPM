class AddComboImageIdToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :combo_image_id, :string
  end
end
