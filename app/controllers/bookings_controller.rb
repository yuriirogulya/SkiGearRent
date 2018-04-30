class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: JSON.pretty_generate(@bookings.as_json)
  end #index

  def show
    @booking = Booking.find(params[:id])
    render json: JSON.pretty_generate(@booking.as_json)
  end #show
end
