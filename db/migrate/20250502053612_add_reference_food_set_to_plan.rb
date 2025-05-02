class AddReferenceFoodSetToPlan < ActiveRecord::Migration[8.0]
  def change
    add_reference :food_sets, :plan, null: false, foreign_key: true
  end
end
