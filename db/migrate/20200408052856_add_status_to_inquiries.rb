class AddStatusToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :status, :integer
    add_column :inquiries, :staff, :string
  end
end
