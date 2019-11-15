class AddDateBookingToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :Date_booking, :date
  end
end
