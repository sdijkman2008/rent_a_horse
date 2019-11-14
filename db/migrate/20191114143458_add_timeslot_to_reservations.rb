class AddTimeslotToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :timeslot, :string
  end
end
