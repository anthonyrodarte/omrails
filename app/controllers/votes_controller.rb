class VotesController < ApplicationController
	before_action :authenticate_user!

  def create
    review = Review.find(params[:id])
    review.liked_by current_user
    redirect_to reviews_path, notice: "You successfully voted for a review"
  end

  def destroy
    review = Review.find(params[:id])
    review.unliked_by current_user
    redirect_to reviews_path, notice: "You successfully unvoted for a review"

  end
end
