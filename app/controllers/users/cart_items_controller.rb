class Users::CartItemsController < ApplicationController
  def index
      @cart_items = current_user.cart_items
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    if user_signed_in?
     cart_item.user_id = current_user.id
   else
   end
    cart_item.save
    redirect_to users_cart_items_path(current_user)
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = "個数または日数を編集しました"
    redirect_to users_cart_items_path(current_user)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to users_cart_items_path(current_user)
  end

  def destroy_all
    binding.pry
    current_user.cart_items.destroy_all
    redirect_to users_cart_items_path(current_user)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id,:combo_id,:quantity,:day,:user_id)
  end
end
