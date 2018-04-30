class CitiesController < ApplicationController
  def index
    @city = City.find(params[:id]).all_items_in_particular_city
    render json: @city
  end #index
end #CitiesController
