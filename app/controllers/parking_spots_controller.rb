class ParkingSpotsController < ApplicationController
    before_action :authenticate_user!
      def index
        @parking_spots = ParkingSpot.where(region_id: params[:region_id])
        respond_to do |format|
          format.html { render partial: "parking_spots/list", locals: { parking_spots: @parking_spots } }
        end
      end
    end
    # parkingspots_controller