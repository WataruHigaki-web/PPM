# frozen_string_literal: true

class Users::ProductCommentsController < ApplicationController
  def create
    @comment = ProductComment.new(product_comment_params)
    @comment.product_id = params[:product_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to users_product_path(@comment.product)
  end

  def destroy
    @comment = ProductComment.find(params[:id])
    @comment.user_id = current_user.id
    @comment.destroy
    redirect_to users_product_path(@comment.product)
  end

  private

  def product_comment_params
    params.require(:product_comment).permit(:content)
  end
end
