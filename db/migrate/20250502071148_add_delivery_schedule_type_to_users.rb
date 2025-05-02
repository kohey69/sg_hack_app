class AddDeliveryScheduleTypeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :delivery_schedule_type, :string
  end
end
