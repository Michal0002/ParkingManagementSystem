class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @parking_spots = ParkingSpot.all


    @errors = flash[:errors] || []

  end
  def create
    @reservation = Reservation.new(reservation_params)
    parking_spot = ParkingSpot.find(reservation_params[:parking_spot_id])
  
    if parking_spot.available? && @reservation.save
      # rezerwacja została pomyślnie utworzona
      parking_spot.update(available: false)
      redirect_to reservations_current_path, notice: "Rezerwacja utworzona pomyślnie. Sprawdź swoje rezerwacje."
    else
      flash[:errors] = @reservation.errors.full_messages
      redirect_to new_reservation_path
    end
  end
  
  
  
  

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :reservation_time, :duration, :user_id, :parking_spot_id, :license_plate)
  end

end
