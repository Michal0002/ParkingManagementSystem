class User < ApplicationRecord

  has_many :reservations

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 3 }
  validates :phone, length: { is: 9 }
  after_create :send_welcome_email


  enum role: [:client, :employee]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end

  def reservations
    Reservation.where(user_id: self.id)
  end
  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
