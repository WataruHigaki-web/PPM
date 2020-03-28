# frozen_string_literal: true

class ProductComment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  attachment :product_image
end
