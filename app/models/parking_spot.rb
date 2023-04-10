class ParkingSpot < ApplicationRecord
    belongs_to :region

    validates :name, presence: true
    validates :region, presence: true
end
