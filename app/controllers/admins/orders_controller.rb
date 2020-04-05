# frozen_string_literal: true

class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def top; end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "返却済" && order.pay_status == true && order.give_point == false
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
    @reserves = Order.where(status: "予約受付中")
    @lendings = Order.where(status: "貸出中")
    @returns = Order.where(status: "郵送中")
  end

  private

  def order_params
    params.require(:order).permit(:status,:get_status, :return_status, :address, :zipcode, :day, :start_date, :finish_date, :user_id,:pay_status,:giv_point)
  end

  def order_record_params
    params.require(:order_record).permit(:status)
  end
end
