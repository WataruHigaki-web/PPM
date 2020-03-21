class Admins::AdminsController < ApplicationController
  def index
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    admin = Admin.find(params[:id])
    if admin.update(admin_params)
      flash[:notice] = "情報変更完了しました！！"
      redirect_to admins_admin_path(admin)
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name,:name_kana,:email,:phone_number,:profile_image)
  end

end
