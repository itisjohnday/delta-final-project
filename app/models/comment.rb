class Comment < ApplicationRecord
  validates :username, presence: true
  validates :description, presence: true
  belongs_to :media_link


end
