class RemoveStartTimeFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :start_time, :datetime
  end
end
