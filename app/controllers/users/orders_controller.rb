# frozen_string_literal: true

class Users::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only:[:destroy,:update]
  def new
   @order = Order.new
  end

  def confirm
    @cart_items = current_user.cart_items
    @in_points = current_user.in_points
    @out_points = current_user.out_points
    @point = @in_points.sum(:point) - @out_points.sum(:point)
    @part_point = OutPoint.new
    @combo_items = ComboItem.all
  end

  def save
    session[:order] = Order.new
    if params['return_status'] == '0'
      session[:order]['return_status'] = params['get_status']
    elsif params['return_status'] == '1'
      session[:order]['address'] = current_user.address
      session[:order]['zip_code'] = current_user.zip_code
    else params['return_status'] == '2'
      session[:order]['address'] = params['address']
      session[:order]['zip_code'] = params['zip_code']
    end
    session[:order]['get_status'] = params['get_status']
    session[:order]['start_date'] = params['start_date']
    session[:order]['finish_date'] = params['finish_date']
    session[:order]['day'] = params['day']
    redirect_to users_orders_confirm_path
  end

  def create
    unless session[:order]['return_status'].nil?
      return_status = session[:order]['return_status']
      zip_code = nil
      address = nil
    else
      return_status = nil
      zip_code = session[:order]['zip_code']
      address = session[:order]['address']
    end
    order = Order.new(
      get_status:    session[:order]['get_status'],
      return_status:  return_status,
      zip_code: zip_code,
      address:  address,
      user_id:       current_user.id,
      start_date:    session[:order]['start_date'],
      finish_date:   session[:order]['finish_date'],
      day:           session[:order]['day'],
      create_point:  params['create_point'],
      status: 0
    )
    order.user_id = current_user.id
    order.save
    out_point = OutPoint.new(
      point: params['out_point'],
      order_id:   order.id,
      user_id:  current_user.id
      )
    out_point.save
    cart_items = current_user.cart_items
    cart_items.each do |item|
      order_record = OrderRecord.new(
        user_id:  current_user.id,
        order_id:   order.id,
        combo_id:   item.combo.id,
        product_id: item.product.id,
        end_price:  item.combo.price,
        quantity:   item.quantity
      )
      order_record.save!
    end
    current_user.cart_items.destroy_all
    redirect_to users_orders_thanks_path
    NotificationMailer.send_complete_to_user(current_user,order).deliver
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to users_root_path(current_user)
  end


  def update
    order = Order.find(params[:id])
    if params[:order]["return_status"] == "0"
      return_status = params[:order]["return_status"]
      zip_code = nil
      address = nil
    elsif params[:order]["return_status"] == "1"
      return_status = nil
      zip_code = current_user.zip_code
      address = current_user.address
    else
      return_status = nil
      zip_code = params["zip_code"]
      address = params["address"]
    end
    order.update(
      day:  params["day"],
      finish_date: params["finish_date"],
      return_status: return_status,
      zip_code: zip_code,
      address:  address,
      status: params["status"]
      )
    flash[:notice] = '返却情報を送信しました。'
    redirect_to users_root_path(current_user)
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks; end

  private

  def order_params
    params.require(:order).permit(:get_status, :zip_code, :address, :return_status, :start_date, :finish_date, :user_id, :day,:status,:create_point)
  end

  def ensure_correct_user
    order = Order.find(params[:id])
    if order.user_id != current_user.id
      redirect_to users_user_path(current_user)
    end
  end
end
