class DeliverySchedule < ApplicationRecord
  DEADLINE_DAYS_BEFORE = 3

  belongs_to :user

  validates :delivery_on, presence: true
  validate :delivery_frequency_within_plan
  validate :change_deadline_not_passed

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

  def change_deadline_not_passed
    return unless delivery_on

    today = Time.zone.today
    limit = delivery_on - DEADLINE_DAYS_BEFORE

    if new_record?
      if today > limit
        errors.add(:delivery_on, "は#{DEADLINE_DAYS_BEFORE}日前（#{limit.strftime('%Y-%m-%d')}）までに登録してください")
      end
    elsif delivery_on_changed? && today > limit
      errors.add(:delivery_on, "は配達日の#{DEADLINE_DAYS_BEFORE}日前（#{limit.strftime('%Y-%m-%d')}）を過ぎているため変更できません")
    end
  end

  def start_time
    delivery_on
  end
end
