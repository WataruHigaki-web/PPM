# frozen_string_literal: true

class Combo < ApplicationRecord
  has_many :combo_items
  has_many :cart_items
  has_many :order_records
  has_many :combo_favorites
  has_many :combo_likes
  attachment :combo_image
end
