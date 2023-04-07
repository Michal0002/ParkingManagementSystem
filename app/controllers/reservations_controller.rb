class ReservationsController < ApplicationController
    def new
      @reservation = Reservation.new
      @parking_spots = ParkingSpot.all

    end
  
    def create
        @reservation = Reservation.new(reservation_params)
        parking_spot = ParkingSpot.find(reservation_params[:parking_spot_id])
    
        if parking_spot.available? && @reservation.save
          parking_spot.update(available: false)
          redirect_to @reservation, notice: "Reservation was successfully created."
        else
          render :new
        end
    end
  
    # def confirm
    #   @reservation = Reservation.find_by(confirm_token: params[:id])
    #   if @reservation
    #     @reservation.update(status: 'accepted')
    #     flash[:notice] = 'Reservation confirmed successfully.'
    #     redirect_to root_path
    #   else
    #     flash[:alert] = 'Unable to confirm reservation.'
    #     redirect_to root_path
    #   end
    # end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:reservation_date, :reservation_time, :user_id, :parking_spot_id)
    end
  end
  