class RemoveCreditNameFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :creditcards, :credit_name, :string
  end
end
