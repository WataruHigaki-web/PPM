class CreateComboFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :combo_favorites do |t|
      t.integer :user_id
      t.integer :combo_id

      t.timestamps
    end
  end
end
