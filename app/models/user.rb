# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]
  has_many :sns_credentials, dependent: :destroy
  has_many :likes
  has_many :product_comments
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :combo_favorites, dependent: :destroy
  has_many :combo_likes, dependent: :destroy
  has_many :pays, dependent: :destroy
  has_many :out_points, dependent: :destroy
  has_many :in_points, dependent: :destroy
  has_many :inquiries, dependent: :destroy
  attachment :profile_image

  validates :name,:email, presence: true

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

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def combo_favorited_by?(user)
    combo_favorites.where(user_id: user.id).exists?
  end

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          name: auth.info.name,
          email: auth.info.email,
          profile_image_id: auth.info.image
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        name: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
end
