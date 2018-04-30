class ItemReviewsController < ApplicationController
  def index
    @item_reviews = Review.where(:reviewable_id => params[:item_id], :reviewable_type => 'Item')
    render json: JSON.pretty_generate(@item_reviews.as_json)
  end #index

  def show
    @item_review = Review.where(:reviewable_id => params[:item_id], :reviewable_type => 'Item').find(params[:id])
    render json: JSON.pretty_generate(@item_review.as_json)
  end #show
end
