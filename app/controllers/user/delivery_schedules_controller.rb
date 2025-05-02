# app/controllers/user/delivery_schedules_controller.rb
class User::DeliverySchedulesController < User::ApplicationController
  before_action :set_schedule, only: %i[edit update]

  def index
    @delivery_schedules = current_user.delivery_schedules.order(:delivery_on)
  end

  def new
    @delivery_schedule = current_user.delivery_schedules.build
  end

  def create
    @delivery_schedule = current_user.delivery_schedules.build(schedule_params)
    if @delivery_schedule.save
      redirect_to user_delivery_schedules_path, notice: '配送スケジュールを登録しました'
    else
      flash.now[:alert] = '配送スケジュールが作成できませんでした'
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @delivery_schedule.update(schedule_params)
      redirect_to user_delivery_schedules_path, notice: '配送スケジュールを更新しました'
    else
      flash.now[:alert] = '配送スケジュールが更新できませんでした'
      render :edit, status: :unprocessable_content
    end
  end

  private

  def set_schedule
    @delivery_schedule = current_user.delivery_schedules.find(params[:id])
  end

  def schedule_params
    params.require(:delivery_schedule).permit(:delivery_on)
  end
end
