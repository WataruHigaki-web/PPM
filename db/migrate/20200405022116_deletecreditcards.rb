class Deletecreditcards < ActiveRecord::Migration[5.2]
  def change
    drop_table :creditcards
  end
end
