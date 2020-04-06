# frozen_string_literal: true

class Admins::CombosController < ApplicationController
  before_action :authenticate_admin!
  def index
    @combos = Combo.all
    @combo = Combo.new
  end

  def edit
    @combo = Combo.find(params[:id])
  end

  def create
    combo = Combo.new(combo_params)
    if combo.save
      flash[:notice] = "「#{combo.name}」を作成しました"
      redirect_to admins_combos_path
    else
      render 'index'
    end
  end

  def update
    combo = Combo.find(params[:id])
    if combo.update(combo_params)
      flash[:notice] = "「#{combo.name}」を編集しました"
      redirect_to admins_combos_path
    else
      render 'edit'
    end
  end

  private

  def combo_params
    params.require(:combo).permit(:name, :price,:combo_image)
  end
end
