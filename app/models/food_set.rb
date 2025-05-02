class FoodSet < ApplicationRecord
  acts_as_list

  has_many :food_set_items, dependent: :destroy
  has_many :foods, through: :food_set_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
