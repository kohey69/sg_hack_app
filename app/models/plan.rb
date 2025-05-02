class Plan < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :food_sets, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
