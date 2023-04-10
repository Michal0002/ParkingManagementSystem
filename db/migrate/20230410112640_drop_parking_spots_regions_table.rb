class DropParkingSpotsRegionsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :parking_spots_regions
  end
end
