class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :random]

  def home
    @waters = Water.all.sample(9)
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
