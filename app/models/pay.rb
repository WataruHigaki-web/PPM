# frozen_string_literal: true

class Pay < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :number,:name, presence: true
end
