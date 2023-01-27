class CategoryPayment < ApplicationRecord
  belongs_to :category
  belongs_to :payment

  validates :category, presence: true
  validates :payment, presence: true
end
