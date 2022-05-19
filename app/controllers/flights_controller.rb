class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    # Provides a nested array for select_tag in view
    @departure_select = uniq_formatted_dates.map { |d| [d, d] }
    search_flights if params[:commit] == 'Search'
  end

  def search_flights
    @flight_options = Flight.search_for_flight(flight_params)
    render 'index'
  end

  private

  def flight_params
    params.permit(:departure_code, :arrival_code, :departure_date, :num_tickets, :commit, flight: [:all_dates])
  end

  def uniq_formatted_dates
    dates = []
    @flights.each { |f| dates << f.format_date(f.depart_datetime) }
    dates.uniq.sort
  end
end
