class Type < ApplicationRecord
  validates :name, presence: true
  has_many :pokemon_types, dependent: :destroy
  has_many :pokemons, through: :pokemon_types
end
