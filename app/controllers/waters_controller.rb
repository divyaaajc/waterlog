class WatersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params.dig(:search, :query).present?
      @waters = Water.search_waters(params[:search][:query]).paginate(page: params[:page], per_page: 20)
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

  def add_water_to_log
    @log = Log.new
    @log.user = current_user
    @water = Water.find(params[:id])
    @log.water = @water
    if @log.save
      redirect_to logs_path
    else
      redirect_to logs_path, notice: "You have already tried this water"
    end
  end
end
