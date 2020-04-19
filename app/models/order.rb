# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :discount
  belongs_to :point_event
  has_many :order_records, dependent: :destroy
  has_one :in_point, dependent: :destroy
  has_one :out_point, dependent: :destroy
  enum status: { 予約受付中: 0, 貸出中: 1, 返却済: 2, 郵送中: 3 }
  enum get_status: { 羽田空港第1ターミナル2F: 0, 羽田空港第2ターミナル2F: 1, 羽田空港第3ターミナル2F: 2, 関西国際空港第1ターミナルビル1F: 3, 関西国際空港第2ターミナル1F: 4 }
  default_scope -> { order(created_at: :desc) }
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :return_status, presence: true
  validates :get_status, presence: true

  validate :presence_date

  def date_connot_be_in_the_past
    unless start_date.present? && start_date < Date.today && start_date < finish_date
      errors.add(:start_date, ": 日付が不正な値です")
    end
  end

  def presence_date
    unless start_date.present? && finish_date.present?
      errors.add(:start_date, '両方の日付を入力してください')
    end
  end
  
  def self.search(kind, search)
    if kind == 'start_date'
      Order.where(start_date: search)
    elsif kind == 'finish_date'
      Order.where(finish_date: search)
    elsif kind == 'user_name'
      Order.joins(:user).where('name LIKE?', "%#{search}%")
    else
      Order.all
    end
  end

end
