class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :product_comments
  has_many :cart_items
  has_many :orders
  has_many :favorites
  has_many :creditcards
  has_many :out_points
  has_many :in_points

end
