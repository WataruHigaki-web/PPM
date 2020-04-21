# frozen_string_literal: true

class Users::CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items if user_signed_in?
    @point_event = PointEvent.find_by(status: true)
    unless params[:search].blank?
      search = params[:search]
      @discount = Discount.search(search)
    end
    @cart_item = Combo.find(1)
    render 'index'
  end

  def save
    session[:cart_item].each do |cart_item|
      if cart_item['status'] == true
        cart_item.destroy
      else
        cart_item = CartItem.new(
          user_id: current_user.id,
          combo_id:   cart_item['combo_id'],
          product_id: cart_item['product_id'],
          quantity:   cart_item['quantity']
        )
        cart_item.save
      end
    end
    session[:cart_item] = []
    redirect_to users_cart_items_path(current_user)
  end

  def create
    session[:cart_item] = [] if !session[:cart_item]
    cart_item = CartItem.new(cart_item_params)
    if user_signed_in?
      cart_item.user_id = current_user.id
      cart_item.save
      redirect_to users_cart_items_path
    else
      session[:cart_item].push(cart_item)
      redirect_to users_cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = '個数を編集しました'
    redirect_to users_cart_items_path(current_user)
  end

  def delete2
    session[:cart_item].delete_at(params['number'].to_i)
    redirect_to users_cart_items_path
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
