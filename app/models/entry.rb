class Entry < ApplicationRecord
  belongs_to :pets_media_link
  has_one :media_link, through: :pets_media_link
end
