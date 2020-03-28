# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_records, dependent: :destroy

  enum get_status: { 羽田空港第1ターミナル2F: 0, 羽田空港第2ターミナル2F: 1, 羽田空港第3ターミナル2F: 2, 関西国際空港第1ターミナルビル1F: 3, 関西国際空港第2ターミナル1F: 4 }
  enum status: { 予約受付中: 0, 貸出中: 1, 返却済: 2, 郵送中: 3 }
  validates :start_date, presence: true
  validates :finish_date, presence: true

  def self.search(kind, search)
    if kind == 'start_date'
      Order.where(start_date: search)
    elsif kind == 'finish_date'
      Order.where('finish_date LIKE?', "%#{search}%")
    elsif kind == 'user_name'
      Order.joins(:user).where('name LIKE?', "%#{search}%")
    else
      Order.all
    end
  end
end
