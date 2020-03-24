class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "登録情報を編集しました"
    redirect_to users_user_path(user)
  end

  def top
    @orders = current_user.orders
  end

  private

  def user_params
    params.require(:user).permit(:name,:name_kana,:zip_code,:address,:phone_nunber,:email)
  end
end
