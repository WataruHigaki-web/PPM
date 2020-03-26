class Product < ApplicationRecord
  has_many :likes,dependent: :destroy
  has_many :product_comments,dependent: :destroy
  has_many :cart_items
  has_many :order_records
  has_many :favorites,dependent: :destroy
  has_many :combo_items
  belongs_to :product_kind

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  

end
