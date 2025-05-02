class Admins::FoodSetsController < Admins::ApplicationController
  before_action :set_food_set, only: %i[show edit update destroy]

  def index
    @food_sets = FoodSet.default_order.page(params[:page])
  end

  def show
  end

  def new
    @food_set = FoodSet.new
  end

  def create
    @food_set = FoodSet.new(food_set_params)
    if @food_set.save
      redirect_to admins_food_set_path(@food_set), notice: '作成しました'
    else
      flash.now[:alert] = '失敗しました'
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @food_set.update(food_set_params)
      redirect_to admins_food_set_path(@food_set), notice: '更新しました'
    else
      flash.now[:alert] = '失敗しました'
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @food_set.destroy!
    redirect_to admins_food_sets_path
  end

  private

  def set_food_set
    @food_set = FoodSet.find(params[:id])
  end

  def food_set_params
    params.expect(food_set: [
      :plan_id, :name, :description, :price,
      { food_set_items_attributes: [
        %i[id food_id quantity position _destroy],
      ] }
    ])
  end
end
