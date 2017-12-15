class Round < ApplicationRecord
  has_many :matches
  has_many :entries, through: :matches
  belongs_to :tournament
end
