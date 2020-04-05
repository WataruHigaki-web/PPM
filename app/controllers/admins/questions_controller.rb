class Admins::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @questions = Question.all
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.save
    flash[:notice] = "質問内容を作成しました。"
    redirect_to admins_questions_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    flash[:notice] = "質問内容を消去しました。"
    redirect_to admins_questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    flash[:notice] = "質問内容を変更しました。"
    redirect_to admins_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:question,:answer)
  end
end
