class CitiesController < ApplicationController
  #params[:id] = City.id
  def index
    @cities = City.all
    render json: JSON.pretty_generate(@cities.as_json)
  end #index

  def show
    @city = City.find(params[:id])
    render json: JSON.pretty_generate(@city.as_json)
  end #show

  def all_items_in_particular_city
    @city = City.find(params[:id]).all_items_in_particular_city
    render json: JSON.pretty_generate(@city.as_json)
  end #all_items_in_particular_city
end #CitiesController
