class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :reviews
  validates :name, uniqueness: true, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
