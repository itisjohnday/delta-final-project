class Round < ApplicationRecord
  belongs_to :tournament
  has_one :round_type
  has_many :matches
end
