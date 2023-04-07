class CreateParkingSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_spots do |t|
      t.string :name
      t.string :region

      t.timestamps
    end
  end
end
