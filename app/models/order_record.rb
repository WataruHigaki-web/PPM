# frozen_string_literal: true

class OrderRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order
  belongs_to :combo
end
