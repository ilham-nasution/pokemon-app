class Move < ApplicationRecord
  belongs_to :pokemon
  validates :name, presence: true
end
