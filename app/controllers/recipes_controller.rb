class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(vegan: params[:vegan], validated: true) if params[:vegan]
    @recipes = Recipe.where(vegetarian: params[:vegetarian], validated: true) if params[:vegetarian]
    @recipes = Recipe.where(celiac: params[:celiac], validated: true) if params[:celiac]
    @recipes = Recipe.where(diabetic: params[:diabetic], validated: true) if params[:diabetic]
    @recipes = RecipePerUser.where(username: params[:username]).map(&:recipe) if params[:username]
    @recipes = RecipePerUser.where(username: params[:username], favorite: true).map(&:recipe) if params[:username] && params[:favorite] == 'true'
    @recipes = RecipePerUser.where(username: params[:username], owner: true).map(&:recipe) if params[:username] && params[:owner]
    @recipes = Recipe.all unless @recipes
    @recipes = @recipes.select { |recipe| recipe.validated == true } # muestro solo las validadas
    render json: @recipes
  end

  def validation_index
    @recipes = Recipe.where(validated: false) - RecipePerUser.where(username: params[:username]).map(&:recipe) if params[:username]
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

  def search
    @recipes = Recipe.search recipe_search_params
    render json: @recipes
  end

  private

  def recipe_create_params
    {
      name: params.require(:name),
      image_url: params.require(:image_url),
      description: params.require(:description),
      steps: params.require(:steps),
      original: params[:original],
      validated: params[:validated] # solo lo agrego para nuestras migraciones (cuando creo un receta se crea en false)
    }
  end

  def recipe_find_params
    {
      id: params.require(:id) # id es el que le viene por url
    }
  end

  def recipe_update_params
    params.slice(:name, :image_url, :validated, :description, :vegetarian, :vegan, :celiac, :diabetic, :steps, :tips, :original)
          .permit!
  end

  def recipe_search_params
    {
      ingredients: params.require(:ingredients),
      excluded_ingredients: params[:excluded_ingredients],
      food_categories: params[:food_categories],
      vegan: params[:vegan],
      vegetarian: params[:vegetarian],
      celiac: params[:celiac],
      diabetic: params[:diabetic]
    }
  end
end
