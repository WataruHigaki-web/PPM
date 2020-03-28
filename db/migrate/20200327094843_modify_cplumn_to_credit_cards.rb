class ModifyCplumnToCreditCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :creditcards, :credit_number, :customer_id
    rename_column :creditcards, :security_code, :card_id
  end
end
