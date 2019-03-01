class ReviewsController < ApplicationController
  def index
    @reviews = Review.All
  end

  def show
    @review = Review.find(params[:id])

  end

  def new
    @review = Review.new
    @butler = User.find(params[:user_id])
  end

  def create
    @review = Review.new(review_params)
    @review.client = current_user
    @review.butler = User.find(params[:user_id])
    @butler = User.find(params[:user_id])
    if @review.save
      redirect_to review_path(@review), notice: "Thanks for the feedback!"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
