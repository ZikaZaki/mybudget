class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # # associations
  # has_many :payments, foreign_key: 'author_id'
  # has_many :categories, foreign_key: 'author_id'

  # validations
  validates :first_name, :last_name, presence: true
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  # validates_associated :payments
  # validates_associated :categories

  def full_name
    [first_name, last_name].join(' ')
  end
end
