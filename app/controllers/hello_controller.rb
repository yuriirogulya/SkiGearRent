class HelloController < ApplicationController

  def items_in_particular_city
    @items = City.find(params[:id]).items
    render json: JSON.pretty_generate(@items.as_json)    
  end
  
  def user_items_reviews
    @reviews = User.find(params[:id]).reviews
    render json: JSON.pretty_generate(@reviews.as_json)
  end

end
