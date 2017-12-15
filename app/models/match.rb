class Match < ApplicationRecord
  has_many :vote_checks
  belongs_to :contestant_1, class_name: 'Entry', foreign_key: 'contestant_1_entry_id'
  belongs_to :contestant_2, class_name: 'Entry', foreign_key: 'contestant_2_entry_id'
  belongs_to :round

  def find_link
    self.contestant_1.pets_media_link.media_link.link
  end
end
