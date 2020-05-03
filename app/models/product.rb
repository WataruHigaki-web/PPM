# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :cart_items
  has_many :order_records
  has_many :favorites, dependent: :destroy
  has_many :combo_items
  belongs_to :product_kind
  attachment :product_image
  validates :name, uniqueness: true

  def on_sale_or_sold_out(product)
    @re_q = OrderRecord.where(combo_id: 1, product_id: product.id, status: "予約受付中").sum(:quantity)
    @le_q = OrderRecord.where(combo_id: 1, product_id: product.id, status: "貸出中").sum(:quantity)
    @tur_q = OrderRecord.where(combo_id: 1, product_id: product.id, status: "郵送中").sum(:quantity)
    if product.stock - @re_q.to_i - @le_q.to_i - @tur_q.to_i == 0
      '売切'
    else
      '販売中'
    end
  end


end
