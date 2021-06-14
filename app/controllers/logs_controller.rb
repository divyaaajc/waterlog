class LogsController < ApplicationController
  def index
    @reviewed = params[:reviewed]
    @waters = params[:all]

    @logs = Log.where(user_id: current_user.id)
    @logs = current_user.reviews if @reviewed
  end
end
