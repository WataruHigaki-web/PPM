class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :combo
end
