# frozen_string_literal: true

class OrderRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  belongs_to :order
  belongs_to :combo
  enum status: { 予約受付中: 0, 貸出中: 1, 返却済: 2, 郵送中: 3 }
  validates :combo_id,:product_id,:quantity,:end_price, presence: true

  # def how_many?(order_record)
  #   @orders.each do |order|
  #     @re_q1 = order.order_records.where(combo_id: combo.id, status: "予約受付中").sum(:quantity)
  #     @le_q1 = order.order_records.where(combo_id: combo.id, status: "貸出中").sum(:quantity)
  #     @tur_q1 = order.order_records.where(combo_id: combo.id, status: "郵送中").sum(:quantity)
  #   end
  # end
end

