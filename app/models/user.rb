class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  belongs_to :plan

  validates :plan_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address_line1, presence: true
  validates :address_line2, presence: true
  validates :phone_number, presence: true
end
