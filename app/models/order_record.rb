# frozen_string_literal: true

class OrderRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  belongs_to :order
  belongs_to :combo

end
