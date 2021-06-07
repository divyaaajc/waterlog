class Water < ApplicationRecord
  has_many :reviews
  has_many :water_tags
  has_many :logs

  validates :name, presence: true, uniqueness: true
  validates :brand, :country, :description, :source, presence: true
  validates :ph, presence: true, numericality: true
end
