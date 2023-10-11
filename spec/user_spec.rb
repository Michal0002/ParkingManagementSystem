require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with all required fields' do
      user = User.new(
        email: 'test@example.com',
        password: "password",
        first_name: 'Michal',
        last_name: 'Kasperek',
        phone: '123456789',
      )
      expect(user).to be_valid
    end
    it 'is invalid without an email' do
      user = User.new(
        first_name: 'Michal',
        last_name: 'Kasperek',
        phone: '123456789',
        role: 1 
      )
      expect(user).not_to be_valid
    end
  end
end
