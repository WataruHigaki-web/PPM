# frozen_string_literal: true

class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update,:show]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = '登録情報を編集しました'
      redirect_to users_user_path(@user)
    else
      render 'edit'
    end
  end

  def top
    @reserves = current_user.orders.where(status: "予約受付中")
    @lendings = current_user.orders.where(status: "貸出中")
    @in_points = current_user.in_points
    @out_points = current_user.out_points
    @point = @in_points.sum(:point) - @out_points.sum(:point)
    @order_reserve = Order.where(user_id: current_user.id).where(status: '予約受付中')
    @order_lending = Order.where(user_id: current_user.id).where(status: '貸出中')
  end

  def point
    @in_points = current_user.in_points
    @out_points = current_user.out_points
    @point = @in_points.sum(:point) - @out_points.sum(:point)
  end

  def withdrawal
    user = User.find(params[:id])
    if user.is_deleted
      user.update(
        is_deleted: false
      )
      flash[:notice] = '利用再開申請を送信しました。PPM管理者からメールにてご対応させていただきます。'
    else
      user.update(
        is_deleted: true,
        status: false
      )
      flash[:notice] = '退会手続が完了しました。復活の際は再開手続をお願いいたします。今までのご利用ありがとうございました。'
    end
    redirect_to users_root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :name, :name_kana, :zip_code, :address, :prefecture_code, :address_city, :address_street, :address_building, :phone_number, :email, :profile_image, :is_deleted, :gender)
  end

  def ensure_correct_user
    user = User.find(params[:id])
    redirect_to users_user_path(current_user) if user != current_user
  end
end
