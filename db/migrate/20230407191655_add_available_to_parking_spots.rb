class AddAvailableToParkingSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :parking_spots, :available, :boolean, default: true
  end
end
