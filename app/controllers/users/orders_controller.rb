class Users::OrdersController < ApplicationController
  def new
  end

  def confirm
    @cart_items = current_user.cart_items
  end
  def save
    session[:order] = Order.new
    if params["return_status"] == "0"
      session[:order]["address"] = params["get_status"]
    elsif params["return_status"] == "1"
      session[:order]["address"] = current_user.address
      session[:order]["zip_code"] = current_user.zip_code
    else params["return_status"] == "2"
      session[:order]["address"] = params["address"]
      session[:order]["zip_code"] = params["zip_code"]
    end
    session[:order]["get_status"] = params["get_status"]
    session[:order]["start_date"] = params["start_date"]
    session[:order]["finish_date"] = params["finish_date"]
    session[:order]["day"] = params["day"]
    redirect_to users_orders_confirm_path
  end

  def create
    order = Order.new(
      get_status:    session[:order]["get_status"],
      return_status: session[:order]["return_status"],
      user_id:       current_user.id,
      start_date:    session[:order]["start_date"],
      finish_date:   session[:order]["finish_date"],
      day:           session[:order]["day"],
      zip_code:      session[:order]["zip_code"],
      address:       session[:order]["address"],
      status:  0
      )
    order.user_id = current_user.id
    order.save!
    cart_items = current_user.cart_items
    cart_items.each do |item|
      order_record = OrderRecord.new(
        user_id:  current_user.id,
        order_id:   order.id,
        combo_id:   item.combo.id,
        product_id: item.product.id,
        end_price:  item.combo.price,
        quantity:   item.quantity,

        )
      order_record.save!
    end
    current_user.cart_items.destroy_all
    redirect_to users_orders_thanks_path
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    flash[:notice] = "返却情報を送信しました。"
    redirect_to users_root_path(current_user)
  end

  def index
    @orders = current_user.orders
  end

  def show
    # @orders = current_user.orders
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:get_status,:zip_code,:address,:return_status,:start_date,:finish_date,:user_id,:day)
  end

end
