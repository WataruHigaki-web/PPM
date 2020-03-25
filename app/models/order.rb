class Order < ApplicationRecord
  belongs_to :user
  has_many :order_records,dependent: :destroy

  enum get_status: {羽田空港第1ターミナル2F:0,羽田空港第2ターミナル2F:1,羽田空港第3ターミナル2F:2,関西国際空港第1ターミナルビル1F:3,関西国際空港第2ターミナル1F:4}
  enum status:{予約受付中:0,貸出中:1,返却済:2,郵送中:3}
end