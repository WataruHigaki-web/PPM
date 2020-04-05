class RemoveStatusFromOrderRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_records, :status, :integer
  end
end
