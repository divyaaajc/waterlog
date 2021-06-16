class LogsController < ApplicationController
  def index
    @reviewed = params[:reviewed]
    @waters = params[:all]
    @logs = Log.where(user_id: current_user.id)
    @logs = current_user.reviews if @reviewed
    @countries = @logs.map do |log|
      country = Geocoder.search([log.water.latitude, log.water.longitude]).first.data["address"]["country"]
      NormalizeCountry(country, to: :alpha3)
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_path, notice: "You have successfully deleted #{@log.water.name}."
  end
end
