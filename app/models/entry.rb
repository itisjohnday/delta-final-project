class Entry < ApplicationRecord
  belongs_to :pets_media_link
  has_one :media_link, through: :pets_media_link
  has_one :pet, through: :pets_media_link

  def match
    Match.where(contestant_1: self.id)[0]
  end
end
