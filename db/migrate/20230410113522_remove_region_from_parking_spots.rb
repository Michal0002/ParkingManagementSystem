class RemoveRegionFromParkingSpots < ActiveRecord::Migration[7.0]
  def change
    remove_column :parking_spots, :region, :string
  end
end
