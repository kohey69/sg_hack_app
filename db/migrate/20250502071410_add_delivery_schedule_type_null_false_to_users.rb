class AddDeliveryScheduleTypeNullFalseToUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :delivery_schedule_type, false
  end
end
