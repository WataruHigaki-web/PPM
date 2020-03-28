# frozen_string_literal: true

class Users::CartItemsController < ApplicationController
  def index
    if user_signed_in?
      @cart_items = current_user.cart_items
    else
      @user = User.find(1)
      @cart_items = @user.cart_items
    end
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    if user_signed_in?
      cart_item.user_id = current_user.id
    else
      #session にuuidあるかどうか確認
      #なければ　uuidをsesssionに入れて、かつそのuuidをカートに保存
      #sessionある場合は その uuidをカートに保存
      SecureRandom.uuid
     
    end
      cart_item.save
      redirect_to users_cart_items_path(current_user)
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = '個数を編集しました'
    redirect_to users_cart_items_path(current_user)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to users_cart_items_path(current_user)
  end

  def destroy_all
    if user_signed_in?
      current_user.cart_items.destroy_all
      redirect_to users_cart_items_path(current_user)
    else
      user = User.find(1)
      user.cart_items.destroy_all
      redirect_to users_cart_items_path(user)
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :combo_id, :quantity, :day, :user_id)
  end
end
