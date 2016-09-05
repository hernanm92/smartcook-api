class FoodCategoriesPerUsersController < ApplicationController
  def create
    @food_category_per_user = FoodCategoryPerUser.create!(food_categories_per_users_create_params)
    render json: @food_category_per_user
  end

  def update
    @food_category_per_user = FoodCategoryPerUser.find_by!(food_categories_per_users_find_params)
    @food_category_per_user.update! food_categories_per_users_update_params
    render json: @food_category_per_user
  end

  def destroy
    @food_category_per_user = FoodCategoryPerUser.find_by!(food_categories_per_users_find_params)
    @food_category_per_user.destroy!
    render json: @food_category_per_user
  end

  private

  def food_categories_per_users_create_params
    {
      food_category_id: params.require(:food_category_id),
      username: params.require(:username)
    }
  end

  def food_categories_per_users_find_params
    {
      food_category_id: params.require(:food_category_id),
      username: params.require(:username)
    }
  end

  def food_categories_per_users_update_params
    {}
  end
end
