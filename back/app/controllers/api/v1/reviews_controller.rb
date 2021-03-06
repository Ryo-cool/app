class Api::V1::ReviewsController < ApplicationController
  # before_action :set_spot,only:[:create]

  def index
    # @reviews= Review.includes(:spots)
    @reviews= Review.all
    render json: @reviews
  end


  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:title,:text,:image,:wentday,:rating).merge(spot_id: params[:spot_id])
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
