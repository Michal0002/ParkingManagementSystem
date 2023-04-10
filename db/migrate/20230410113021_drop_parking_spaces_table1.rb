class DropParkingSpacesTable1 < ActiveRecord::Migration[7.0]
  def change
    drop_table :parking_spaces
  end
end
