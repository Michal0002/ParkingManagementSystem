class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 3 }
  validates :phone, length: { is: 9 }


  enum role: [:client, :employee]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end


end
