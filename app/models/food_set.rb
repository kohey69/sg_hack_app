class FoodSet < ApplicationRecord
  acts_as_list

  belongs_to :plan
  has_many :food_set_items, dependent: :destroy
  has_many :foods, through: :food_set_items

  accepts_nested_attributes_for :food_set_items, allow_destroy: true, reject_if: :all_blank

  scope :default_order, -> { order(position: :asc) }

  validates :plan_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :food_ids_unique_within_form

  private

  def food_ids_unique_within_form
    food_ids = food_set_items.reject(&:marked_for_destruction?).map(&:food_id)
    duplicate_foods = food_ids.group_by(&:itself).select { |_, v| v.size > 1 }.keys
    errors.add(:food_id, "同じ食品が重複しています: #{duplicate_foods.join(', ')}") if duplicate_foods.any?
  end
end
