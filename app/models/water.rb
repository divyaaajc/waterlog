class Water < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :water_tags, dependent: :destroy
  has_many :tags, through: :water_tags, dependent: :destroy
  has_many :logs, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :brand, :country, :description, :source, presence: true
  validates :ph, presence: true, numericality: true

  include PgSearch::Model
  pg_search_scope :search_waters,
    against: [ :name, :brand, :description, :country, :source ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
