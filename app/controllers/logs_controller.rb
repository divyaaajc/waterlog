class LogsController < ApplicationController
  def index
    @logs = Log.where(user_id: current_user.id)
  end
end
