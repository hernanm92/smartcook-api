class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    @recipe = Recipe.find_by!(recipe_find_params)
    render json: @recipe
  end

  def create
    @recipe = Recipe.create!(recipe_create_params)
    render json: @recipe
  end

  def update
    @recipe = Recipe.find_by!(recipe_find_params)
    @recipe.update! recipe_update_params
    render json: @recipe
  end

  def destroy
    @recipe = Recipe.find_by!(recipe_find_params)
    @recipe.destroy!
    render json: @recipe
  end

  private

  def recipe_create_params
    {
      name: params.require(:name),
      image_url: params.require(:image_url),
      description: params.require(:description),
      steps: params.require(:steps),
      tips: params[:tips]
    }
  end

  def recipe_find_params
    {
      id: params.require(:id) # id es el que le viene por url
    }
  end

  def recipe_update_params
    params.slice(:name, :image_url, :validated, :description, :vegetarian, :vegan, :celiac, :diabetic, :steps, :tips)
          .permit!
  end
end
