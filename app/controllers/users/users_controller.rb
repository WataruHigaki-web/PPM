# frozen_string_literal: true

class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = '登録情報を編集しました'
    redirect_to users_user_path(user)
  end

  def top
    @orders = current_user.orders
    @in_points = current_user.in_points
    @out_points = current_user.out_points
    @point = @in_points.sum(:point) - @out_points.sum(:point)
  end

  def point
    @in_points = current_user.in_points
    @out_points = current_user.out_points
    @point = @in_points.sum(:point) - @out_points.sum(:point)
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :zip_code, :address, :phone_nunber, :email,:profile_image)
  end
end
