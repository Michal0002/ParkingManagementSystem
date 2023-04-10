class RemoveParkingSpotsRegionIdFromParkingSpots < ActiveRecord::Migration[7.0]
  def change
    remove_index :parking_spots, :parking_spots_region_id
    remove_column :parking_spots, :parking_spots_region_id, :integer, null: false
  end
end
