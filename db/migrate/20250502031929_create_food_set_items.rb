class CreateFoodSetItems < ActiveRecord::Migration[8.0]
  def change
    create_table :food_set_items do |t|
      t.references :food, null: false, foreign_key: true, index: false
      t.references :food_set, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :position, null: false
      t.index %i[food_id food_set_id], unique: true
      t.timestamps
    end
  end
end
