class WatersController < ApplicationController

  def index
    if params[:query].present?
      @waters = Water.search_waters(params[:query])
    else
      @waters = Water.all
    end
  end

  def show
    @water = Water.find(params[:id])
  end
end
