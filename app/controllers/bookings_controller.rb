class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:booking][:flight_id])
    num_tickets = params[:booking][:num_tickets].to_i
    num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new
    @booking.flight = Flight.find(params[:booking][:flight_id])
    params[:booking][:passengers_attributes].each do |passenger|
      @booking.passengers.build(name: passenger[1][:name], email: passenger[1][:email])
    end

    if @booking.valid?
      @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessibly_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(booking: %i[num_tickets flight_id passengers_attributes:[name email]])
  end
end
