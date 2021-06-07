class WaterTag < ApplicationRecord
  belongs_to :water
  belongs_to :tag

  validates :water, uniqueness: { scope: :tag }
end
