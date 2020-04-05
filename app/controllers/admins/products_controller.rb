# frozen_string_literal: true

class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @product_kinds = ProductKind.all
    if params[:product_kind_id].present?
      @product_kind = ProductKind.find(params[:product_kind_id])
      @products = Product.where(product_kind_id: @product_kind.id)
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @combo_item = ComboItem.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      flash[:notice] = "「#{product.name}」を作成しました"
      redirect_to admins_product_path(product)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:notice] = "「#{product.name}」を編集しました"
      redirect_to admins_product_path(product)
    else
      render 'edit'
    end
  end

  def new
    @product = Product.new
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admins_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :product_kind_id, :product_image, :price, :status, :combo_id,:stock)
  end
end
