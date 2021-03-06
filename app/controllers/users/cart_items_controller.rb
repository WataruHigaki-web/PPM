# frozen_string_literal: true

class Users::CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items if user_signed_in?
    @point_event = PointEvent.find_by(status: true)
    unless params[:search].blank?
      search = params[:search]
      @discount = Discount.search(search)
      session["discount"] = @discount
    end
    if params["commit"] == "削除"
      session["discount"] = []
    end
    @cart_item = Combo.find(1)
  end

  def save_day
    if params["day"].to_i > 0
      session["day"] = params["day"].to_i
      redirect_to users_cart_items_path(turbolinks: false)
    else
      render 'index'
    end
  end

  def save_discount
    session["discount"] = params["discount"].to_i
    redirect_to users_cart_items_path
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
    unless user_signed_in?
      session[:cart_item] = [] if !session[:cart_item]
      cart_item = CartItem.new(cart_item_params)
      session[:cart_item].push(cart_item)
      redirect_to users_cart_items_path
    else
      if params["favorite"] == "all"
        current_user.favorites.each do |favorite|
          cart_item = CartItem.new(
            product_id: favorite.product.id,
            combo_id: 1,
            quantity: 1,
            user_id: current_user.id
            )
          cart_item.save
        end
        current_user.combo_favorites.each do |favorite|
          cart_item = CartItem.new(
            combo_id: favorite.combo.id,
            quantity: 1,
            user_id: current_user.id
            )
          cart_item.save
        end
        redirect_to users_cart_items_path
      else
        cart_item = CartItem.new(cart_item_params)
        cart_item.user_id = current_user.id
        cart_item.save
        redirect_to users_cart_items_path
      end
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = '個数を編集しました'
    redirect_to users_cart_items_path
  end

  def session_delete
    session[:cart_item].delete_at(params['number'].to_i)
    redirect_to users_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to users_cart_items_path
  end

  def destroy_all
    if user_signed_in?
      current_user.cart_items.destroy_all
      redirect_to users_cart_items_path
    else
      user = User.find(1)
      user.cart_items.destroy_all
      redirect_to users_cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :combo_id, :quantity, :day, :user_id)
  end
end
