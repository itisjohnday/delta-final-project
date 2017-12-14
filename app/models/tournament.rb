class Tournament < ApplicationRecord
  has_many :rounds
  has_many :matches, through: :rounds
  has_many :entries, through: :matches, through: :rounds
end
