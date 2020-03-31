# frozen_string_literal: true

class OutPoint < ApplicationRecord
  belongs_to :user
  belongs_to :order
end
