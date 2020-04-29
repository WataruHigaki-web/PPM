class Users::ComboCommentsController < ApplicationController
    def create
    @comment = ComboComment.new(combo_comment_params)
    @comment.combo_id = params[:combo_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to users_combo_path(@comment.combo)
  end

  def destroy
    @comment = ComboComment.find(params[:id])
    @comment.user_id = current_user.id
    @comment.destroy
    redirect_to users_combo_path(@comment.combo)
  end

  private

  def combo_comment_params
    params.require(:combo_comment).permit(:content)
  end
end


