class RecipesPerUsersController < ApplicationController
  def create
    @recipe_per_user = RecipePerUser.create!(recipes_per_users_create_params)
    render json: @recipe_per_user
  end

  def update
    @recipe_per_user = RecipePerUser.find_by!(recipes_per_users_find_params)
    @recipe_per_user.update! recipes_per_users_update_params
    render json: @recipe_per_user
  end

  def destroy
    @recipe_per_user = RecipePerUser.find_by!(recipes_per_users_find_params)
    @recipe_per_user.destroy!
    render json: @recipe_per_user
  end

  private

  def recipes_per_users_create_params
    {
      recipe_id: params.require(:recipe_id),
      username: params.require(:username),
      favorite: params.require(:favorite),
      owned: params.require(:owned),
      vote: params[:vote]
    }
  end

  def recipes_per_users_find_params
    {
      recipe_id: params.require(:recipe_id),
      username: params.require(:username)
    }
  end

  def recipes_per_users_update_params
    params.slice(:favorite, :vote).permit!
  end
end
