# frozen_string_literal: true

class PointEvent < ApplicationRecord
  has_many :orders
end
