class Tournament < ApplicationRecord
  has_many :rounds
  has_many :matches, through: :rounds
  has_many :entries, through: :matches

  def winner
    if self.rounds.last.matches[0].contestant_1
      if self.rounds.last.matches[0].contestant_1.vote_count > self.rounds.last.matches[0].contestant_2.vote_count
        self.rounds.last.matches[0].contestant_1
      else
        self.rounds.last.matches[0].contestant_2
      end
    else
      nil
    end
  end
end
