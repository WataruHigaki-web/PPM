class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "ユーザーステータスを「#{user.status}」に変更しました"
      redirect_to admins_user_path(user)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:name,:name_kana,:zip_code,:address,:email,:status)
  end
end
