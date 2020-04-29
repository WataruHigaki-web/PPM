class Users::CombosController < ApplicationController
  def show
    @combo = Combo.find(params[:id])
    @cart_item = CartItem.new
    @comments = @combo.combo_comments
    @comment = ComboComment.new
  end

  private

  def combo_params
    params.require(:combo).permit(:combo_id, :quantity)
  end
end
