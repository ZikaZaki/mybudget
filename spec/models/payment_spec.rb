require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:payment) { Payment.new(name: 'Food', amount: 100, author_id: 1) }

  describe 'Validations' do
    it 'is not valid without a name' do
      payment.name = nil
      expect(payment).to_not be_valid
    end

    it 'is not valid without an amount' do
      payment.amount = nil
      expect(payment).to_not be_valid
    end

    it 'is not valid without an author' do
      payment.author_id = nil
      expect(payment).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many category_payments' do
      assc = described_class.reflect_on_association(:category_payments)
      expect(assc.macro).to eq :has_many
    end
  end
end
