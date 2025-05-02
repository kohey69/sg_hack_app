class Admins::FoodsController < Admins::ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.default_order.page(params[:page])
  end

  def show
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to admins_food_path(@food), notice: '食品が正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      redirect_to admins_food_path(@food), notice: '食品が正常に更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    redirect_to admins_foods_path, notice: '食品が正常に削除されました。'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.expect(food: %i[name description refrigerated])
  end
end
