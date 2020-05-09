# frozen_string_literal: true

class Pay < ApplicationRecord
  belongs_to :user

  validates :number,:name, presence: true
end
