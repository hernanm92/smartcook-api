class FoodCategoriesController < ApplicationController
  def index
    @food_categories = FoodCategory.all
    render json: @food_categories
  end

  def show
    @food_category = FoodCategory.find_by!(food_category_find_params)
    render json: @food_category
  end

  def create
    @food_category = FoodCategory.create!(food_category_create_params)
    render json: @food_category
  end

  def update
    @food_category = FoodCategory.find_by!(food_category_find_params)
    @food_category.update! food_category_update_params
    render json: @food_category
  end

  def destroy
    @food_category = FoodCategory.find_by!(food_category_find_params)
    @food_category.destroy!
    render json: @food_category
  end

  private

  def food_category_create_params
    {
      name: params.require(:name)
    }
  end

  def food_category_find_params
    {
      id: params.require(:id)
    }
  end

  def food_category_update_params
    params.slice(:name).permit!
  end
end
