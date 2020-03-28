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
  end

  private

  def order_params
    params.require(:order).permit(:get_status, :return_status, :address, :zipcode, :status, :day, :start_date, :finish_date, :user_id)
  end
end
