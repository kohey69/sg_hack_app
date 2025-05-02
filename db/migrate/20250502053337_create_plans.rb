class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :published, null: false, default: false
      t.timestamps
    end
  end
end
