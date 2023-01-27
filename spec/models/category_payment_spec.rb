require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  let(:category_payment) { CategoryPayment.new(category_id: 1, payment_id: 1) }

  describe 'Validations' do
    it 'is not valid without a category' do
      category_payment.category = nil
      expect(category_payment).to_not be_valid
    end

    it 'is not valid without a payment' do
      category_payment.payment = nil
      expect(category_payment).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to category' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to payment' do
      assc = described_class.reflect_on_association(:payment)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
