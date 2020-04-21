# frozen_string_literal: true

class ProductKind < ApplicationRecord
  has_many :products
  validates :name, presence: true
end
