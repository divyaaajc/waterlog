class Tag < ApplicationRecord
  has_many :water_tags

  validates :name, presence: true, uniqueness: true
end
