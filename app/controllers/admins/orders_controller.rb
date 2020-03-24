class Admins::OrdersController < ApplicationController
  def top
  end
  
  def index
    @orders = Orders.all
  end

  def show
    @order = Order.find(parms[:id])
  end

  def update
    order_record = OrderRecord.find(parms[:id])
    order.update(order_record_params)
    redirect_to admins_order_path(order_record.order)
  end

  def stock
    @products = Product.all
  end

  private

  def order_params
    params.reqiure(:order).permit(:get_status,:return_status,:address,:zipcode)
  end

  def order_record_params
    params.require(:order_record).permit(:status)
  end

end
