class Match < ApplicationRecord
  has_many :vote_checks
  has_one :contestant_1_entry
  has_one :contestant_2_entry
  belongs_to :round
end
