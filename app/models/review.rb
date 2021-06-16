class Review < ApplicationRecord
  belongs_to :water
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, numericality: { less_than_or_equal_to: 5 }
end
