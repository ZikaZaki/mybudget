require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(first_name: 'John', last_name: 'Doe', email: 'zika@gmail.com', password: '123456') }
  describe 'Validations' do
    it 'is not valid without a first name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a last name' do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      user.password_confirmation = nil
      expect(user).to_not be_valid
    end

    it 'is not valid if password and password confirmation are different' do
      user.password
      user.password_confirmation = '1234567'
      expect(user).to_not be_valid
    end
  end
end
