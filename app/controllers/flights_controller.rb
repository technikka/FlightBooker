class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    # need a nested array for select_tag in view
    @departure_select = uniq_formatted_dates.map { |d| [d, d] }
  end

  private

  def uniq_formatted_dates
    dates = []
    @flights.each { |f| dates << f.format_date(f.depart_datetime) }
    dates.uniq.sort
  end
end
