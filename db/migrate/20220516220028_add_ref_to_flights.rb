class AddRefToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :departure_airport, references: :airports, index: true

    add_reference :flights, :arrival_airport, references: :airports, index: true
  end
end
