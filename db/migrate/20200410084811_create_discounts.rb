# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :number
      t.string :name
      t.text :introduction
      t.integer :price
      t.date :start_date
      t.date :finish_date

      t.boolean :status

      t.timestamps
    end
  end
end
