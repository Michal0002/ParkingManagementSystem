class Region < ApplicationRecord
    has_many :parking_spots
    def available_parking_spots
        parking_spots.where(available: true)
      end
end
