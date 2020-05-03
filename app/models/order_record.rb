# frozen_string_literal: true

class OrderRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  belongs_to :order
  belongs_to :combo
  enum status: { 予約受付中: 0, 貸出中: 1, 返却済: 2, 郵送中: 3 }
  validates :combo_id,:quantity,:end_price, presence: true

end

