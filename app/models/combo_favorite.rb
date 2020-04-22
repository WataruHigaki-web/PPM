class ComboFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :combo
end
