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
end
