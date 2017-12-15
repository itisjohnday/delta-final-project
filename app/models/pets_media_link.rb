class PetsMediaLink < ApplicationRecord
  belongs_to :pet
  has_one :user, through: :pets
  belongs_to :media_link
  has_many :entries
end
