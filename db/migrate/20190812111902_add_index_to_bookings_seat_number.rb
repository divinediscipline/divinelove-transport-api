class AddIndexToBookingsSeatNumber < ActiveRecord::Migration[5.2]
  def change
    add_index :bookings, :seat_number, unique: true
  end
end
