class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: :departure_airport_id

  has_many :arriving_flights, class_name: 'Flight', foreign_key: :arrival_airport_id

  def self.codes
    codes = []
    Airport.all.each { |a| codes << a.code }
    codes
  end
end
