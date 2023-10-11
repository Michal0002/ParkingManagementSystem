class ReservationsController < ApplicationController
  before_action :authenticate_user!
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
      UserMailer.activation_link(@reservation).deliver_now
      redirect_to reservations_current_path, notice: "Rezerwacja utworzona pomyślnie. Sprawdź swoje rezerwacje."
    else
      flash[:errors] = @reservation.errors.full_messages
      redirect_to new_reservation_path
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: "Rezerwacja została zaktualizowana."
    else
      render :edit
    end
  end
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    parking_spot = @reservation.parking_spot
    parking_spot.available = true
    parking_spot.save
    redirect_to root_path, notice: "Rezerwacja została anulowana."
  end

  def get_parking_spots
    region = Region.find(params[:region_id])
    parking_spots = region.parking_spots.where(available: true)
    render json: parking_spots.to_json
  end
  def activate
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: 'accepted')
    redirect_to root_path, notice: "Rezerwacja została zaakceptowana."
  end
  
  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def reservation_params
    params.require(:reservation).permit(:reservation_date, :reservation_time, :duration, :user_id, :parking_spot_id, :license_plate, :region_id)
  end

end
