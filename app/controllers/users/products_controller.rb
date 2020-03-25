class Users::ProductsController < ApplicationController
  def top
  end
  
  def index
    @favorites = Favorite.all
    @cart_item = CartItem.new
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    
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

  private

  def product_params
    params.require(:product).permit(:name,:introduction,:product_kind_id,:product_image,:price,:status)
  end

end
