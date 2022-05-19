class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.flight = params[:flight_id]
    @num_tickets = params[:num_tickets]
  end

  def create
    @booking = Booking.new
  end
end
