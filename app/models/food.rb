class Food < ApplicationRecord
  has_many :food_set_items, dependent: :destroy
  has_many :food_sets, through: :food_set_items

  validates :name, presence: true
  validates :description, presence: true

  scope :default_order, -> { order(name: :asc) }
end
