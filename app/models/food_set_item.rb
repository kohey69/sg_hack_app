class FoodSetItem < ApplicationRecord
  acts_as_list scope: :food_set

  belongs_to :food
  belongs_to :food_set

  validates :food_id, uniqueness: { scope: :food_set_id }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
