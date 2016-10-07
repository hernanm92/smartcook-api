class RecipesPerUsersController < ApplicationController
  def index
    # @recipe_per_user = RecipePerUser.where(:username => params[:username],:recipe_id => params[:recipe_id]) if params[:recipe_id]
    # @recipe_per_user = RecipePerUser.where(:username => params[:username],:favorite => true) if params[:username] unless @recipe_per_user
    @recipe_per_user = RecipePerUser.where(:username => params[:username])
    render json: @recipe_per_user
  end
  def show
    @recipe_per_user = RecipePerUser.find_by!(recipes_per_users_find_params)
    render json: @recipe_per_user
  end

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
      owner: params.require(:owner),
      like: params[:like],
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
    params.slice(:favorite, :vote, :like).permit!
  end
end
