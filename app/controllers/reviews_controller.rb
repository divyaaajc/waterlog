class ReviewsController < ApplicationController

  def create
    @review = Review.new(strong_params)
    @water = Water.find(params[:water_id])
    @review.water = @water
    @review.user = current_user
    if @review.save
      redirect_to water_path(@water)
    else
      render water_path(@water) #render :new
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(strong_params)
      redirect_to water_path(@water)
    else
      render water_path(@water) #render :edit
    end
  end

  def destroy
    @review = Reivew.find(params[:id])
    @review.destroy
    redirect_to water_path(@review.water),  notice: 'Review was successfully deleted' #look into
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end
end
