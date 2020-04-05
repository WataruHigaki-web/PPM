class ModifyUserIdToPays < ActiveRecord::Migration[5.2]
  def change
    change_column :pays, :user_id, :bigint
  end
end
