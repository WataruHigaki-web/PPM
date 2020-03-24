class AddStatusToOrderRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :order_records, :status, :integer
  end
end
