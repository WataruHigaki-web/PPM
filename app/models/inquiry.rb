class Inquiry < ApplicationRecord
  belongs_to :user
  enum status: {未対応: 0,対応中: 1,解決済: 2}
end
