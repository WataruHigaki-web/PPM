# frozen_string_literal: true

class InPoint < ApplicationRecord
  belongs_to :user
  belongs_to :order
end
