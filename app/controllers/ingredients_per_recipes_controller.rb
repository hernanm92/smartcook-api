class IngredientsPerRecipesController < ApplicationController
  def show
    @ingredient_per_recipe = IngredientPerRecipe.find_by!(ingredient_per_recipe_find_params)
    render json: @ingredient_per_recipe
  end

  def create
    @ingredient_per_recipe = IngredientPerRecipe.create!(ingredient_per_recipe_create_params)
    render json: @ingredient_per_recipe
  end

  def update
    @ingredient_per_recipe = IngredientPerRecipe.find_by!(ingredient_per_recipe_find_params)
    @ingredient_per_recipe.update! ingredient_per_recipe_update_params
    render json: @ingredient_per_recipe
  end

  def destroy
    @ingredient_per_recipe = IngredientPerRecipe.find_by!(ingredient_per_recipe_find_params)
    @ingredient_per_recipe.destroy!
    render json: @ingredient_per_recipe
  end

  private

  def ingredient_per_recipe_create_params
    {
      ingredient_id: params.require(:ingredient_id),
      recipe_id: params.require(:recipe_id),
      amount: params.require(:amount),
      unit: params.require(:unit)
    }
  end

  def ingredient_per_recipe_find_params
    {
      ingredient_id: params.require(:ingredient_id),
      recipe_id: params.require(:recipe_id)
    }
  end

  def ingredient_per_recipe_update_params
    params.slice(:amount, :unit).permit!
  end
end
