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

  def self.search(method,search)
    if method == "partial_match"
      User.where("name LIKE?","%#{search}%")
    elsif method == "forward_match"
      User.where("name LIKE?","#{search}%")
    elsif method == "backward_match"
      User.where("name LIKE?","%#{search}")
    elsif method == "perfect_match"
      User.where(name: "#{search}")
    else
      User.all
    end
  end

  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end
end
