class Log < ApplicationRecord
  belongs_to :water
  belongs_to :user

  validates :water, uniqueness: { scope: :user }
end
