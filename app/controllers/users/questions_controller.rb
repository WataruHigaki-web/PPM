# frozen_string_literal: true

class Users::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def index
    @questions = Question.page(params[:page]).per(10)
    @inquiry = Inquiry.new
    @inquiries = current_user.inquiries.page(params[:page]).per(10)
  end

  def create
    inquiry = Inquiry.new(inquiry_params)
    inquiry.user_id == current_user.id
    if inquiry.save
      flash[:notice] = '質問内容を送信しました。返答についてはメールで対応させていただきます。'
      redirect_to users_questions_path(current_user)
    end
  end

  def destroy
    inquiry = Inquiry.find(params[:id])
    inquiry.destroy
    flash[:notice] = '質問内容を削除しました。'
    redirect_to users_questions_path(current_user)
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :user_id, :status, :staff)
  end

  def ensure_correct_user
    inquiry = Inquiry.find(params[:id])
    if inquiry.user_id != current_user.id
      redirect_to users_user_path(current_user)
    end
  end
end
