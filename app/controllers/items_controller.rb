class ItemsController < ApplicationController
  # params[:id] = User.id
  def index
    @items = Item.all
    render json: JSON.pretty_generate(@items.as_json)
  end #index

  def show
    @item = Item.find(params[:id])
    render json: JSON.pretty_generate(@item.as_json)
  end #show

  def all_user_items_reviews
    @item_reveiws = User.find(params[:id]).all_user_items_reviews
    render json: JSON.pretty_generate(@item_reveiws.as_json)
  end #all_user_items_reviews
end #ItemsController
