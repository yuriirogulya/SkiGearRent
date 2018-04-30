class ItemsController < ApplicationController
  def index
    if params[:id]
      @item_reveiws = User.find(params[:id]).all_user_items_reviews
      render json: JSON.pretty_generate(@item_reveiws.as_json)
    else
      @item_reveiws = User.all.map(&:all_user_items_reviews)
      render json: JSON.pretty_generate(@item_reveiws.reject(&:blank?).as_json)
    end #if params[:id]
  end #index
end #ItemsController
