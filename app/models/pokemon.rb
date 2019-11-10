class Pokemon < ApplicationRecord
  has_many :moves, dependent: :destroy
  has_many :pokemon_types, dependent: :destroy
  has_many :types, through: :pokemon_types
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
end
