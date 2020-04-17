# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  belongs_to :combo
end
