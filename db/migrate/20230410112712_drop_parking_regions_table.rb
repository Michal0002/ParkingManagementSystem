class DropParkingRegionsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :parking_regions
  end
end
