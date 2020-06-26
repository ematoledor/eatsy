class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :description, :rating, presence: true
end
