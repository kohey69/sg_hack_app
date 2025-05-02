class DeliverySchedule < ApplicationRecord
  belongs_to :user

  validates :delivery_on, presence: true
  validate :delivery_frequency_within_plan

  def delivery_frequency_within_plan
    case user.delivery_schedule_type
    when 'weekly'
      range = delivery_on.all_week
      if user.delivery_schedules.where(delivery_on: range).where.not(id: id).exists?
        errors.add(:delivery_on, '週1回プランでは同じ週に複数登録できません')
      end
    when 'twice_monthly'
      range = delivery_on.all_month
      if user.delivery_schedules.where(delivery_on: range).where.not(id: id).count >= 2
        errors.add(:delivery_on, '月2回プランでは同じ月に3回以上登録できません')
      end
    end
  end

  def start_time
    delivery_on
  end
end
