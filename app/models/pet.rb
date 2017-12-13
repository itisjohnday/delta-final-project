class Pet < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  belongs_to :user
  has_many :pets_media_links
  has_many :media_links, through: :pets_media_links
end
