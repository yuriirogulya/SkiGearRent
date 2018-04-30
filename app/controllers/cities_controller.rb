class CitiesController < ApplicationController
  def index
    if params[:id]
      @city = City.find(params[:id]).all_items_in_particular_city
      render json: JSON.pretty_generate(@city.as_json)
    else
      @city = City.all.map(&:all_items_in_particular_city)
      render json: JSON.pretty_generate(@city.as_json)
    end #if params.nil?
  end #index
end #CitiesController
