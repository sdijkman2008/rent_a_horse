class ReservationsController < ApplicationController
def index
  @reservations = Reservation.all
end

def create
  @reservation = Reservation.new(reservation_params)
  @horse = Horse.find(params[:horse_id])
  @reservation.horse = @horse
  @reservation.user = current_user
  authorize @reservation
  if @reservation.save
    redirect_to horse_path(@horse)
  else
    render :new
  end
end

  private

  def reservation_params
    params.require(:reservation).permit(:date_available, :status, :timeslot)
  end

#   def index
#     reservation = Reservation(params[:horse])
#     if @horse.reservation.empty?
#       p "there are no horses available to ride yet"
#     elsif @horse.reservation.status() == "available"
#       @horse.reservations.each do |reservation|
#       reservation.status
#     end
#     else p "all horses have been booked"
#   end
# end
end
