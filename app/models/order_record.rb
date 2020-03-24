class OrderRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order
end
