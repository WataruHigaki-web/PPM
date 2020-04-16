# frozen_string_literal: true

class Discount < ApplicationRecord
  has_many :orders

  def self.search(search)
    Discount.find_by(number: search)
  end
end
