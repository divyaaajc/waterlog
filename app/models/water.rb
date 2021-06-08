class Water < ApplicationRecord
  has_many :reviews
  has_many :tags, through: :water_tags, dependent: :destroy
  has_many :logs

  validates :name, presence: true, uniqueness: true
  validates :brand, :country, :description, :source, presence: true
  validates :ph, presence: true, numericality: true
end
