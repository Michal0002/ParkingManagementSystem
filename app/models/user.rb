class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  enum role: [:client, :employee]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end


end
