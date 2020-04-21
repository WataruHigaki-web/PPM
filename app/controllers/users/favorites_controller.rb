# frozen_string_literal: true

class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variable
  def create
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id, :user_id)
  end

  private

  def set_variable
    @product = Product.find(params[:product_id])
    @id_name = "#favorite-link-#{@product.id}"
  end
end