class AddForeignLeyToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :passengers, :bookings, column: :booking_id, index: true
  end
end
