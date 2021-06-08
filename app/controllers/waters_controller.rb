class WatersController < ApplicationController

  def index
    @waters = Water.all
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

