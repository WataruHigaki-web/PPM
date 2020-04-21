# frozen_string_literal: true

class ComboItem < ApplicationRecord
  belongs_to :combo
  belongs_to :product

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
