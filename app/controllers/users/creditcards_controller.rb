class Users::CreditcardsController < ApplicationController
  def index
    @creditcards = current_user.creditcards
    @creditcard = Creditcard.new
  end
  
  def create
    binding.pry
    creditcard = Creditcard.new
    creditcard.user_id = current_user.id
    if creditcard.save
      flash[:notice] = "クレジットカードを作成しました"
      redirect_to users_creditcards_path(current_user)
    else
      render 'index'
    end
  end
  
  def edit
    @creditcard = Creditcard.find(params[:id])
  end

  def update
    creditcard = Creditcard.find(params[:id])
    creditcard.update(creditcard_params)
    redirect_to users_creditcards_path(current_user)
  end

  def destroy
    creditcard = Creditcard.find(params[:id])
    creditcard.destroy
    flash[:notice] = "クレジットカードを削除しました"
    redirect_to users_creditcards_path(current_user)
  end

  private
  def creditcard_params
    params.require(:creditcard).permit(:user_id,:customer_id,:card_id)
  end
end