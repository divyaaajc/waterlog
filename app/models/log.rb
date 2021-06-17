class Log < ApplicationRecord
  belongs_to :water
  belongs_to :user

  before_destroy :delete_review

  validates :water, uniqueness: { scope: :user }

  def delete_review
    review = self.water.reviews.find_by(user: self.user)
    review.destroy if review 
  end
end
