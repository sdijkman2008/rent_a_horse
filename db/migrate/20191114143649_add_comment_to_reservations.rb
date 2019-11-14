class AddCommentToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :comment, :string
  end
end
