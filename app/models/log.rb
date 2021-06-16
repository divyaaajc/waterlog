class Log < ApplicationRecord
  belongs_to :water, dependent: :destroy
  belongs_to :user

  validates :water, uniqueness: { scope: :user }
end
