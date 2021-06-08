class Water < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :water_tags, dependent: :destroy
  has_many :tags, through: :water_tags, dependent: :destroy
  has_many :logs, dependent: :destroy
  geocoded_by :location

  validates :name, presence: true, uniqueness: true
  validates :brand, :country, :description, :source, presence: true
  validates :ph, presence: true, numericality: true
  after_validation :geocode, if: :will_save_change_to_source?

  private

  def location
    "#{source} #{country}"
  end 
end
