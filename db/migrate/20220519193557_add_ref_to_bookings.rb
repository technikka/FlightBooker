class AddRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :passenger, index: true

    add_reference :bookings, :flight, index: true
  end
end
