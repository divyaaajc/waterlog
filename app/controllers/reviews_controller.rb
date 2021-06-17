class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy, :edit, :update]

  def create
    @review = Review.new(strong_params)
    @water = Water.find(params[:water_id])
    @review.water = @water
    @review.user = current_user
    if @review.save
      flash[:success] = 'Your review was successfully added! See it in '
      redirect_to water_path(@water)
    else
      render 'waters/show'
    end
    Log.create(user: current_user, water: @water)
  end

  def update
    if @review.update(strong_params)
      redirect_to water_path(@review.water)
    else
      render 'waters/show'
    end
  end

  def destroy
    @review.destroy
    redirect_to water_path(@review.water), notice: 'Review was successfully deleted'
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
