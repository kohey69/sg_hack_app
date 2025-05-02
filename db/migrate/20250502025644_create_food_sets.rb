class CreateFoodSets < ActiveRecord::Migration[8.0]
  def change
    create_table :food_sets do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
