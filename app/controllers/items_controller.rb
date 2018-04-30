class ItemsController < ApplicationController
  def index
    @item_reveiws = User.find(params[:id]).all_user_items_reviews
    render json: @item_reveiws
  end #index
end #ItemsController
