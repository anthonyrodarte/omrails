class Review < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true

  acts_as_votable
end
