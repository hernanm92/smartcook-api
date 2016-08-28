class RecipesPerUsersController < ApplicationController
  def create
    @recipes_per_users = Ingredient.create!(recipes_per_users_create_params)
    render json: @recipes_per_users
  end

  def update
    @recipes_per_users = Ingredient.find_by!(recipes_per_users_find_params)
    @recipes_per_users.update! recipes_per_users_update_params
    render json: @recipes_per_users
  end

  def destroy
    @recipes_per_users = Ingredient.find_by!(recipes_per_users_find_params)
    @recipes_per_users.destroy!
    render json: @recipes_per_users
  end

  private

  def recipes_per_users_create_params
    {
      recipe_id: params.require(:recipe_id),
      user_id: params.require(:user_id),
      favorite: params.require(:favorite),
      owned: params.require(:owned),
      vote: params[:vote]
    }
  end

  def recipes_per_users_find_params
    {
      id: params.require(:id)
    }
  end

  def recipes_per_users_update_params
    params.slice(:favorite, :vote).permit!
  end
end
