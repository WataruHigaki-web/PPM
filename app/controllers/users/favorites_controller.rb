# frozen_string_literal: true

class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to users_products_path(current_user)
  end

  def destroy
    @product = Product.find(params[:user_id])
    favorite = Favorite.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to users_products_path(current_user)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id, :user_id)
  end
end
