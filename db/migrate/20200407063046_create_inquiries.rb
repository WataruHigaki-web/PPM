class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.text :content
      t.integer :user_id
      t.timestamps
    end

  end
end
