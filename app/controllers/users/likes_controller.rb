# frozen_string_literal: true

class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variable
  def create
    @product = Product.find(params[:product_id])
    like = @product.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    like = current_user.likes.find_by(product_id: @product.id)
    like.destroy
  end

  private

  def set_variable
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end
