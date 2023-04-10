class AddLicensePlateToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :license_plate, :string
  end
end
