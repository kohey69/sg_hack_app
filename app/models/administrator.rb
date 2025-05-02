class Administrator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :registerable, :recoverable, :rememberable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
end
