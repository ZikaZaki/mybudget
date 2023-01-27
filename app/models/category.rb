class Category < ApplicationRecord
  # associations
  belongs_to :author, class_name: 'User'
  has_many :category_payments, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :icon, presence: true
  validates :name, length: { maximum: 100 }
  validates_associated :category_payments

  def total
    category_payments.reduce(0) { |sum, num| sum + num.payment.amount }
  end
end
