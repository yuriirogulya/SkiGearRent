class UserReviewsController < ApplicationController
  def index
    @user_reviews = Review.where(:reviewable_id => params[:user_id], :reviewable_type => 'User')
    render json: JSON.pretty_generate(@user_reviews.as_json)
  end #index

  def show
    @user_review = Review.where(:reviewable_id => params[:user_id], :reviewable_type => 'User').find(params[:id])
    render json: JSON.pretty_generate(@user_review.as_json)
  end #show
end #ReviewController
