class Users::ComboItemsController < ApplicationController

  def index
    @combos = Combo.all
    @cart_item = CartItem.new
    if params[:combo_id].present?
      @combo = Combo.find(params[:combo_id])
      @combo_items = ComboItem.where(combo_id: @combo.id)
    else
      @combo_items = ComboItem.all
    end
  end

  private

  def combo_item_params
    params.require(:combo_item).permit(:product_id,:combo_id,:quantity)
  end
end
