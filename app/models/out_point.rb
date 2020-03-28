# frozen_string_literal: true

class OutPoint < ApplicationRecord
  belongs_to :user
end
