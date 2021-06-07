class Review < ApplicationRecord
  belongs_to :water
  belongs_to :user
end
