# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]
  has_many :likes
  has_many :product_comments
  has_many :cart_items
  has_many :orders
  has_many :favorites
  has_many :pays
  has_many :out_points
  has_many :in_points
  has_many :inquiries
  attachment :profile_image


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.search(method, search)
    if method == 'partial_match'
      User.where('name LIKE?', "%#{search}%")
    elsif method == 'forward_match'
      User.where('name LIKE?', "#{search}%")
    elsif method == 'backward_match'
      User.where('name LIKE?', "%#{search}")
    elsif method == 'perfect_match'
      User.where(name: search.to_s)
    else
      User.all
    end
  end

  def already_liked?(product)
    likes.exists?(product_id: product.id)
  end
end
