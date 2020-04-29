class CreateComboComments < ActiveRecord::Migration[5.2]
  def change
    create_table :combo_comments do |t|
      t.integer :user_id
      t.integer :combo_id
      t.string :content

      t.timestamps
    end
  end
end
