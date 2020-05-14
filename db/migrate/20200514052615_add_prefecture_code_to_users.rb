class AddPrefectureCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prefecture_code, :integer
  end
end
