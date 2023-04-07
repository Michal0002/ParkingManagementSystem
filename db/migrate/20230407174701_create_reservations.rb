class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.integer :reservation_time
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :parking_spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
