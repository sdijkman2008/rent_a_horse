class AddDateAvailableToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :date_available, :date
  end
end
