# frozen_string_literal: true

class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,only:[:update]
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

  def withdrawal
    binding.pry
    user = User.find(params[:id])
    user.update(
     is_deleted: true
    )
    flash[:notice] = "退会手続が完了しました。復活の際は再開手続をお願いいたします。今までのご利用ありがとうございました。"
    redirect_to users_root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_id,:name, :name_kana, :zip_code, :address, :phone_nunber, :email,:profile_image,:is_deleted)
  end

  def ensure_correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to users_user_path(current_user)
    end
  end
end
