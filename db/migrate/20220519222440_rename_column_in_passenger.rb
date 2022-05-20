class RenameColumnInPassenger < ActiveRecord::Migration[7.0]
  def change
    rename_column :passengers, :bookings_id, :booking_id
  end
end
