class AddBookingsRefToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_reference :passengers, :bookings, index: true
  end
end
