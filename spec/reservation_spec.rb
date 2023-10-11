require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it 'is valid with all required fields' do
      user = User.first.id
      parking_spot_id = ParkingSpot.first.id
      reservation = Reservation.new(
        license_plate: 'EZD19WW',
        reservation_date: Date.parse('24-12-2023'),
        reservation_time: Time.parse('16:50:00'),
        parking_spot_id: parking_spot_id,
        user_id: user,
        duration: 15
      )
      expect(reservation).to be_valid
    end
    it 'is not valid without correct reservation date' do
      user = User.first.id
      parking_spot_id = ParkingSpot.first.id
      reservation = Reservation.new(
        license_plate: 'EZD19WW',
        reservation_date: Date.yesterday,
        reservation_time: Time.parse('16:50:00'),
        parking_spot_id: parking_spot_id,
        user_id: user,
        duration: 15
      )
      expect(reservation).not_to be_valid
    end
  end
end