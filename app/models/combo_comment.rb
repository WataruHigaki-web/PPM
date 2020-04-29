class ComboComment < ApplicationRecord
  belongs_to :user
  belongs_to :combo
  validates :content,presence: true
end
