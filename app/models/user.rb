class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :horses, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true
end
