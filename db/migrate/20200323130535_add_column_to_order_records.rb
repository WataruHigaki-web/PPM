class AddColumnToOrderRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_records, :combo, foreign_key: true
  end
end
