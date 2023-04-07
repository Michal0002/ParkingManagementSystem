class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot

  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  validates :status, presence: true
  validates :user_id, presence: true
  validates :parking_spot_id, presence: true
  enum status: [:accepted, :waiting_for_accept, :canceled, :completed]

  before_validation :set_default_status

  private

  def set_default_status
    self.status ||= 'waiting_for_accept'
  end
end
