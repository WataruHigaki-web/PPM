class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.integer :number
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
