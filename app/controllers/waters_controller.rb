class WatersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @waters = Water.search_waters(params[:query]).paginate(page: params[:page], per_page: 20)
    else
      @waters = Water.paginate(page: params[:page], per_page: 20)
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
