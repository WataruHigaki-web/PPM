# frozen_string_literal: true

class CreatePointEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :point_events do |t|
      t.string :name
      t.integer :bonus

      t.timestamps
    end
  end
end
