class AddcolumnToPointEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :point_events, :start_date, :date
    add_column :point_events, :finish_date, :date
    add_column :point_events, :status, :boolean, default: false, null: false
  end
end
