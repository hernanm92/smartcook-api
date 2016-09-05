class IngredientsController < ApplicationController
  def index
    @ingredients = IngredientPerRecipe.where(recipe_id: params[:recipe_id]).map(&:ingredient) if params[:recipe_id]
    @ingredients = Ingredient.all unless @ingredients
    render json: @ingredients
  end

  def show
    @ingredient = Ingredient.find_by!(ingredient_find_params)
    render json: @ingredient
  end

  def create
    @ingredient = Ingredient.create!(ingredient_create_params)
    render json: @ingredient
  end

  def update
    @ingredient = Ingredient.find_by!(ingredient_find_params)
    @ingredient.update! ingredient_update_params
    render json: @ingredient
  end

  def destroy
    @ingredient = Ingredient.find_by!(ingredient_find_params)
    @ingredient.destroy!
    render json: @ingredient
  end

  private

  def ingredient_create_params
    {
      name: params.require(:name),
      image_url: params.require(:image_url),
      food_category_id: params.require(:food_category_id),
      vegetarian: params.require(:vegetarian),
      vegan: params.require(:vegan),
      celiac: params.require(:celiac),
      diabetic: params.require(:diabetic),
      calories: params.require(:calories),
      proteins: params.require(:proteins),
      carbohydrates: params.require(:carbohydrates),
      fats: params.require(:fats)
    }
  end

  def ingredient_find_params
    {
      id: params.require(:id) # id es el que le viene por url
    }
  end

  def ingredient_update_params
    params.slice(
      :name, :image_url, :food_category_id, :vegetarian, :vegan, :celiac, :diabetic,
      :calories, :proteins, :carbohydrates, :fats
    ).permit!
  end
end
