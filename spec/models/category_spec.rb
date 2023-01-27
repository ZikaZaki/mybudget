require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.new(name: 'Food', author_id: 1) }

  describe 'Validations' do
    it 'is not valid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is not valid without an author' do
      category.author_id = nil
      expect(category).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many category_payments' do
      assc = described_class.reflect_on_association(:category_payments)
      expect(assc.macro).to eq :has_many
    end
  end
end
