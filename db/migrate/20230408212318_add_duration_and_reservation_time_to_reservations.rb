class AddDurationAndReservationTimeToReservations < ActiveRecord::Migration[7.0]
  def change
      add_column :reservations, :duration, :integer
      change_column :reservations, :reservation_time, :time
  end
end
