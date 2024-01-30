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
  validates :license_plate, format: { with: /\A[A-Z]{2,3}\s?[A-Z0-9]{4,5}\z/ }
  validate :reservation_date_not_in_past

  enum :status, [:accepted, :waiting_for_accept, :canceled, :completed], default: :waiting_for_accept
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "duration", "id", "license_plate", "parking_spot_id", "reservation_date", "reservation_time", "status", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["parking_spot", "user"]
  end
private 
def reservation_date_not_in_past
  if reservation_date.present? && reservation_date < Date.today
    errors.add(:reservation_date, "nie może być przeszłą datą")
  end
end
end
