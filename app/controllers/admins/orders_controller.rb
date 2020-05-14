# frozen_string_literal: true

class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def top
    @point_event = PointEvent.find_by(status: true)
  end

  def user_orders
    @user = User.find(params["format"].to_i)
    @orders = @user.orders.page(params[:page]).per(10).order('created_at DESC')
  end

  def staff_orders
    @orders = Order.where(lender: current_admin.name).or(Order.where(receiver: current_admin.name)).page(params[:page]).per(10).order('created_at DESC')
  end

  def index
    @orders = Order.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    order.order_records.each do |record|
      record.update(
        status: params[:order]["status"]
      )
    end
    if order.status == '返却済' && order.pay_status == true && order.give_point == false
      in_point = InPoint.new(
        point: order.create_point,
        order_id:   order.id,
        user_id:  order.user.id
      )
      in_point.save
      order.give_point = true
      order.update(order_params)
    end
    redirect_to admins_orders_path
  end

  def search
    kind = params[:search_kind]
    search = params[:search]
    @orders = Order.search(kind, search)
    render 'index'
  end

  def stock
    @products = Product.all
    @orders = Order.all
    @combos = Combo.all
    @combo_items = ComboItem.all
    @reserves = Order.where(status: '予約受付中')
    @lendings = Order.where(status: '貸出中')
    @returns = Order.where(status: '郵送中')
  end

  private

  def order_params
    params.require(:order).permit(:status, :get_status, :return_status, :address, :zipcode, :day, :start_date, :finish_date, :user_id, :pay_status, :giv_point, :pay_id, :lender, :receiver)
  end

  def order_record_params
    params.require(:order_record).permit(:status)
  end

  def user_params
    params.require(:user).permit(:user_id)
  end
end
