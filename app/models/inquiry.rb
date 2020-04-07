class Inquiry < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
