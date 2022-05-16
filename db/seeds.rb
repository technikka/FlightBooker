# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# To ensure each seed starts fresh, delete all records from tables:
Airport.destroy_all
Flight.destroy_all

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
