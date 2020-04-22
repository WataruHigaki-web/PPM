class Users::ComboFavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variable
  def create
    @combo = Combo.find(params[:combo_id])
    combo_favorite = @combo.combo_favorites.new(user_id: current_user.id)
    combo_favorite.save
  end

  def destroy
    @combo = Combo.find(params[:combo_id])
    combo_favorite = current_user.combo_favorites.find_by(combo_id: @combo.id)
    combo_favorite.destroy
  end

  private

  def set_variable
    @combo = Combo.find(params[:combo_id])
    @id_name = "#combo-favorite-link-#{@combo.id}"
  end
end
