class Plan < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :food_sets, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  scope :default_order, -> { order(:id) }
  scope :published, -> { where(published: true) }
end
