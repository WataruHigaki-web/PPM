class Combo < ApplicationRecord
  has_many :combo_items
  has_many :cart_items
  has_many :order_records
end
