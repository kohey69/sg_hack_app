class Admins::PlansController < Admins::ApplicationController
  before_action :set_plan, only: %i[show edit update destroy]

  def index
    @plans = Plan.default_order.page(params[:page])
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to admins_plan_path(@plan), notice: '食品が正常に作成されました。'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @plan.update(plan_params)
      redirect_to admins_plan_path(@plan), notice: '食品が正常に更新されました。'
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @plan.destroy
    redirect_to admins_plans_path, notice: '食品が正常に削除されました。'
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.expect(plan: %i[name description published])
  end
end
