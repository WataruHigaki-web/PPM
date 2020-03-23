class Admins::ComboItemsController < ApplicationController

  def index
    @combos = Combo.all
    if params[:combo_id].present?
      @combo = Combo.find(params[:combo_id])
      @combo_items = ComboItem.where(combo_id: @combo.id)
    else
      @combo_items = ComboItem.all
    end
  end

  def create
    combo_item = ComboItem.new(combo_item_params)
    combo_item.save
    redirect_to admins_combo_items_path
  end

  def destroy
    combo_item = ComboItem.find(params[:id])
    combo_item.destroy
    redirect_to admins_combo_item_path(combo_item)
  end

  def destroy_all
    @combo.combo_items.destroy_all
    redirect_to admins_combo_item_path(combo_item)
  end

  def update
    combo_item = ComboItem.find(params[:id])
    combo_item.update(combo_item_params)
    redirect_to admins_combo_item_path(combo_item)
  end

  private

  def combo_item_params
    params.require(:combo_item).permit(:product_id,:combo_id,:quantity)
  end
end
