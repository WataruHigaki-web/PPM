class AddUserIdToOrderRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_records, :user, foreign_key: true
  end
end
