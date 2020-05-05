# frozen_string_literal: true

class Combo < ApplicationRecord
  has_many :combo_items
  has_many :cart_items
  has_many :order_records
  has_many :combo_favorites
  has_many :combo_likes
  has_many :combo_comments
  attachment :combo_image

  def reserve(combo)
    OrderRecord.where(combo_id: combo.id, status: "予約受付中").sum(:quantity)
  end

  def lending(combo)
    OrderRecord.where(combo_id: combo.id, status: "貸出中").sum(:quantity)
  end

  def git return(combo)
    OrderRecord.where(combo_id: combo.id, status: "郵送中").sum(:quantity)
  end
end
