class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :about, :random]

  def home
    @waters = Water.all.sample(9)
    # added for sake of Demo -- for Sommelier section
    @picked_water_1 = Water.find_by('name ILIKE ?', 'foz%')
    @picked_water_2 = Water.find_by('name ILIKE ?', 'icelandic%')
    @picked_water_3 = Water.find_by('name ILIKE ?', 'lahuenco%')
  end

  def about
  end

  def random
    random_water
    @review = Review.new
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = [
      {
        lat: @water.latitude,
        lng: @water.longitude
      }]
  end

  private

  def random_water
    @water = Water.all.sample(1).first
  end
end
