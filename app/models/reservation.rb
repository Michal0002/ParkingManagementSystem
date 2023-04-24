class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot
  accepts_nested_attributes_for :user

  validates :reservation_date,:reservation_time,:status, :license_plate,:user_id,:parking_spot_id, :duration, presence: true
  validates :license_plate, format: { with: /\A[A-Z]{3}\s?[A-Z0-9]{1,2}\s?[A-Z0-9]{1,3}\z/ }

  enum :status, [:accepted, :waiting_for_accept, :canceled, :completed], default: :waiting_for_accept


end
