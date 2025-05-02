class CreateDeliverySchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.date :delivery_on, null: false
      t.timestamps
    end
  end
end
