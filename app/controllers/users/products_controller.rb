# frozen_string_literal: true

class Users::ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  def top
  end

  def index
    @favorites = Favorite.all
    @cart_item = CartItem.new
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @comments = @product.product_comments
    @comment = ProductComment.new
    @combo_item = ComboItem.find_by(product_id: @product.id, combo_id: 1)
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :product_kind_id, :product_image, :price, :status)
  end

end
