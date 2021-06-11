class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @waters = Water.all.sample(9)
  end

  def about
  end
end
