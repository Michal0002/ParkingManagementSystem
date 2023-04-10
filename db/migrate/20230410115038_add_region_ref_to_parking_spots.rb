class AddRegionRefToParkingSpots < ActiveRecord::Migration[7.0]
  def change
    add_reference :parking_spots, :region, null: false, foreign_key: true
  end
end
