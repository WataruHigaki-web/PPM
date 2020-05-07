# frozen_string_literal: true

class Users::DiscountsController < ApplicationController
  def index
    @discounts = Discount.page(params[:page]).per(10).order('created_at DESC')
    @discount = Discount.find_by(price: 0)
  end

  def show
    @discount = Discount.find(params[:id])
  end

  private

  def discount_params
    params.require(:discount).permit(:name, :introduction, :number, :price, :status, :start_date, :finish_date)
  end
end
