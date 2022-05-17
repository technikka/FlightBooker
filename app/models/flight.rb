class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def format_date(datetime)
    datetime.strftime('%b %d, %Y')
  end
end
