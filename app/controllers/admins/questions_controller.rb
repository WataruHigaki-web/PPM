# frozen_string_literal: true

class Admins::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  def inquiry_index
    @inquiries = Inquiry.where(status: "未対応").page(params[:page]).per(10)
  end

  def working_on_index
    @working_on = Inquiry.where(status: "対応中").page(params[:page]).per(10)
  end

  def resolve_index
     @resolves = Inquiry.where(status: "解決済").page(params[:page]).per(10)
  end
  
  def index
    @questions = Question.page(params[:page]).per(10).order('created_at DESC')
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.save
    flash[:notice] = '質問内容を作成しました。'
    redirect_to admins_questions_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    flash[:notice] = '質問内容を消去しました。'
    redirect_to admins_questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    flash[:notice] = '質問内容を変更しました。'
    redirect_to admins_questions_path
  end

  def inquiry_update
    inquiry = Inquiry.find(params[:id])
    inquiry.update(
      status: params[:inquiry]['status'],
      staff: params[:inquiry]['staff']
    )
    flash[:notice] = '質問ステータスを変更しました'
    redirect_to admins_questions_inquery_index_path
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:question, :answer)
  end

  def inquiry_params
    params.require(:inquiry).permit(:content, :user_id, :status, :staff)
  end
end
