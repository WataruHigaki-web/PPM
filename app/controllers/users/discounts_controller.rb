# frozen_string_literal: true

class Users::DiscountsController < ApplicationController
  before_action :authenticate_user!
  def index
    @discounts = Discount.all
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
