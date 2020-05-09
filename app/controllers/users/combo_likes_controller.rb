class Users::ComboLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variable
  def create
    combo_like = @combo.combo_likes.new(user_id: current_user.id)
    combo_like.save
  end

  def destroy
    combo_like = current_user.combo_likes.find_by(combo_id: @combo.id)
    combo_like.destroy
  end

  private

  def set_variable
    @combo = Combo.find(params[:combo_id])
    @id_name = "#combo-like-link-#{@combo.id}"
  end
end
