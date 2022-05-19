class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:booking][:flight_id])
    @num_tickets = params[:booking][:num_tickets].to_i
    @num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(booking: %i[num_tickets flight_id])
  end
end
