# frozen_string_literal: true

class Users::PaysController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: %i[destroy update]
  def index
    @pays = current_user.pays
    @pay = Pay.new
  end

  def create
    pay = Pay.new(pay_params)
    pay.user_id = current_user.id
    if pay.save
      flash[:notice] = 'クレジットカードを作成しました'
      redirect_to users_pays_path(current_user)
    else
      render 'index'
    end
  end

  def edit
    @pay = Pay.find(params[:id])
  end

  def update
    pay = Pay.find(params[:id])
    pay.update(pay_params)
    redirect_to users_pays_path(current_user)
  end

  def destroy
    pay = Pay.find(params[:id])
    pay.destroy
    flash[:notice] = 'クレジットカードを削除しました'
    redirect_to users_pays_path(current_user)
  end

  private

  def pay_params
    params.require(:pay).permit(:user_id, :number, :name)
  end

  def ensure_correct_user
    pay = Pay.find(params[:id])
    redirect_to users_user_path(current_user) if pay.user_id != current_user.id
  end
end
