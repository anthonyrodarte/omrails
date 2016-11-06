class Review < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
end
