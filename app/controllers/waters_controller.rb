class WatersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @waters = Water.search_waters(params[:query])
    else
      @waters = Water.all
    end
  end

  def show
    @water = Water.find(params[:id])

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = [
      {
        lat: @water.latitude,
        lng: @water.longitude
      }]
  end
end

