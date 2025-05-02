class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  enumerize :delivery_schedule_type, in: %i[weekly twice_monthly]

  attribute :delivery_schedule_type, :string, default: :weekly

  belongs_to :plan
  has_many :delivery_schedules, dependent: :destroy

  validates :plan_id, presence: true
  validates :delivery_schedule_type, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address_line1, presence: true
  validates :address_line2, presence: true
  validates :phone_number, presence: true
end
