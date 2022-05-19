class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def format_date(datetime)
    datetime.strftime('%b %d, %Y')
  end

  def format_time(datetime)
    datetime.strftime('%l:%M%p')
  end

  def self.search_for_flight(params)
    flights = Flight.includes(:departure_airport).includes(:arrival_airport)
    flights.select do |f|
      next unless f.departure_airport.code == params[:departure_code] &&
                  f.arrival_airport.code == params[:arrival_code]

      if params[:flight][:all_dates] == '0'
        next unless f.format_date(f.depart_datetime) == params[:departure_date]
      end
      true
    end
  end
end
