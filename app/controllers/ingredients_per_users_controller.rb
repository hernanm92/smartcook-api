class IngredientsPerUsersController < ApplicationController
  def create
    @ingredient_per_user = IngredientPerUser.create!(ingredients_per_users_create_params)
    render json: @ingredient_per_user
  end

  def update
    @ingredient_per_user = IngredientPerUser.find_by!(ingredients_per_users_find_params)
    @ingredient_per_user.update! ingredients_per_users_update_params
    render json: @ingredient_per_user
  end

  def destroy
    @ingredient_per_user = IngredientPerUser.find_by!(ingredients_per_users_find_params)
    @ingredient_per_user.destroy!
    render json: @ingredient_per_user
  end

  private

  def ingredients_per_users_create_params
    {
      ingredient_id: params.require(:ingredient_id),
      username: params.require(:username)
    }
  end

  def ingredients_per_users_find_params
    {
      ingredient_id: params.require(:ingredient_id),
      username: params.require(:username)
    }
  end

  def ingredients_per_users_update_params
    {}
  end
end
