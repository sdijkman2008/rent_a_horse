class RemoveDateBookingFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :Date_booking, :date
  end
end
