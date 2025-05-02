class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :frozen, null: false, default: false
      t.timestamps
    end
  end
end
