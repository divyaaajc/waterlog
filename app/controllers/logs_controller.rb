class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def create
    @log = Log.new
    @log.user = current_user
    @water = params[:water_id]
    @log.water = @water
    if @log.save
      redirect_to water_path(@water)
    else
      render 'waters/show'
    end
  end
end
