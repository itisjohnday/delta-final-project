class PetsMediaLink < ApplicationRecord
  belongs_to :pet
  belongs_to :media_link
  has_many :entries
end
