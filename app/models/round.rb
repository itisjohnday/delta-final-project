class Round < ApplicationRecord
  belongs_to :tournament
  has_one :round_name
  has_many :matches
end
