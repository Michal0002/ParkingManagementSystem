# == Schema Information
#
# Table name: reservations
#
#  id               :integer          not null, primary key
#  duration         :integer
#  license_plate    :string
#  reservation_date :date
#  reservation_time :time
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  parking_spot_id  :integer          not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_reservations_on_parking_spot_id  (parking_spot_id)
#  index_reservations_on_user_id          (user_id)
#
# Foreign Keys
#
#  parking_spot_id  (parking_spot_id => parking_spots.id)
#  user_id          (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot
  accepts_nested_attributes_for :user

  validates :reservation_date,:reservation_time,:status, :license_plate,:user_id,:parking_spot_id, :duration, presence: true
  validates :license_plate, format: { with: /\A[A-Z]{3}\s?[A-Z0-9]{1,2}\s?[A-Z0-9]{1,3}\z/ }

  enum :status, [:accepted, :waiting_for_accept, :canceled, :completed], default: :waiting_for_accept


end
