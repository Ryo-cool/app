class Api::V1::ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    render json: @review
  end

  private
  def review_params
    params.require(:review).permit(:title,:text,:image,:wentday,:rating,:spot_id,).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
