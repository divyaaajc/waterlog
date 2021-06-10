class WatersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params.dig(:search, :query).present?
      @waters = Water.search_waters(params[:search][:query])
    else
      @waters = Water.all
    end
  end

  def show
    @water = Water.find(params[:id])
    @review = Review.new
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = [
      {
        lat: @water.latitude,
        lng: @water.longitude
      }]
  end
end
