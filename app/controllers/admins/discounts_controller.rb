class Admins::DiscountsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @discount = Discount.new
    @discounts = Discount.all
  end

  def create
    discount = Discount.new(
      name: params[:discount]['name'],
      number: params[:discount]['number'],
      introduction: params[:discount]['introduction'],
      price: params[:discount]['price'],
      status: params[:discount]['status'],
      start_date: params['start_date'],
      finish_date: params['finish_date']
      )
    if discount.save
      flash[:notice] = "「#{discount.name}」ジャンル作成しました"
      redirect_to admins_discounts_path
    else
      render 'index'
    end
  end

  def edit
    @discount = Discount.find(params[:id])
  end

  def update
    discount = Discount.find(params[:id])
    if discount.update(
      name: params[:discount]['name'],
      number: params[:discount]['number'],
      introduction: params[:discount]['introduction'],
      price: params[:discount]['price'],
      status: params[:discount]['status'],
      start_date: params['start_date'],
      finish_date: params['finish_date']
      )
      flash[:notice] = 'ポイントイベント編集完了しました'
      redirect_to admins_discounts_path
    else
      render 'edit'
    end
  end

  def destroy
    discount = Discount.find(params[:id])
    discount.destroy
    flash[:notice] = "「#{discount.name}」ポイントイベント削除完了しました"
    redirect_to admins_discounts_path
  end

  private

  def discount_params
    params.require(:discount).permit(:name,:introduction,:number,:price,:status,:start_date,:finish_date)
  end
end
