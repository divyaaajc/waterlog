class WatersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params.dig(:search, :query).present?
      @waters = Water.search_waters(params[:search][:query]).paginate(page: params[:page], per_page: 21)
    else
      @waters = Water.paginate(page: params[:page], per_page: 21)
    end
  end

  def show
    @water = Water.find(params[:id])
    @review = Review.new
    @reviewed = user_reviewed? if current_user
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
      flash.notice = "#{@water.name} has been successfully added to your waters... See it in Your Waters"
    else
      flash.notice = "You have already tried this water"
    end
  end

  def user_reviewed?
    @user = current_user
    @water = Water.find(params[:id])
    @intersection = @user.reviews & @water.reviews
    return false if @intersection.empty?

    return true
  end
end
