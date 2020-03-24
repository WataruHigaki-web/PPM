class RemoveDayFromOrderRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_records, :day, :integer
  end
end
