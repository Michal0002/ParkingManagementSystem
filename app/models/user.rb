# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord

  has_many :reservations

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w\.-]+@([\w-]+\.)+[\w-]{2,4}\z/ }
  validates :first_name, :last_name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true, length: { is: 9 }
  
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

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "first_name", "id", "last_name", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
end
