# To ensure each seed starts fresh, reset the database before seeding:
#   db:drop
#   db:create
#   db:migrate

airports = %i[ATL LAX DEN JFK PHX BOS DTW SAN PDX]
airports.each do |ap|
  Airport.create!(code: ap)
end

50.times do
  flight = Flight.new
  airports = Airport.all
  departure_airport = airports.sample
  flight.departure_airport = departure_airport
  arriving_airport = airports.sample
  until arriving_airport != departure_airport
    arriving_airport = airports.sample
  end
  flight.arrival_airport = arriving_airport
  flight.depart_datetime = Faker::Time.forward(days: 30, format: :long)
  flight.duration_in_minutes = (60..240).to_a.sample
  flight.save!
end
