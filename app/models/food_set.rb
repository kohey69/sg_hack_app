class FoodSet < ApplicationRecord
  acts_as_list

  has_many :food_set_items, dependent: :destroy
  has_many :foods, through: :food_set_items

  accepts_nested_attributes_for :food_set_items, allow_destroy: true, reject_if: :all_blank

  scope :default_order, -> { order(position: :asc) }

  validates :plan_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
