# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  image_url   :string
#  stars       :float
#  validated   :boolean
#  description :text
#  vegetarian  :boolean
#  vegan       :boolean
#  celiac      :boolean
#  diabetic    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  steps       :string           default([]), is an Array
#  original    :integer
#  likes       :integer
#

class Recipe < ActiveRecord::Base
  has_many :tips

  has_many :ingredients_per_recipes, dependent: :destroy, class_name: 'IngredientPerRecipe'
  has_many :ingredients, through: :ingredients_per_recipes

  has_many :recipes_per_users, dependent: :destroy, class_name: 'RecipePerUser'
  has_many :users, through: :recipes_per_users

  validates :name, presence: true, length: { in: 5..50 }
  # uniqueness: true (que la validacion del nombre se haga a nivel front, para el update necesito repetir el nombre)
  validates :description, presence: true, length: { in: 5..300 }
  validates :steps, presence: true # , length: { in: 5..50 }
  validates :likes, numericality: { only_integer: true }
  # validates :stars, numericality: { only_integer: false }

  after_initialize :set_defaults
  before_create :set_restrictions

  def self.search(restrictions)
    recipes = Recipe.where(validated: true)
    recipes = filter_food_restrictions recipes, restrictions
    recipes = filter_food_categories recipes, restrictions[:food_categories] if restrictions[:food_categories]
    recipes = filter_excluded_ingredients recipes, restrictions[:excluded_ingredients] if restrictions[:excluded_ingredients]
    best_recipes recipes, restrictions[:ingredients]
  end

  def owner
    self.recipes_per_users.where(owner: true).map(&:user).first
  end

  def validate_update
    original_recipe = Recipe.find_by_id(self.original)
    original_recipe.update!(name: self.name, image_url: self.image_url, description: self.description, steps: self.steps)

    original_recipe.ingredients_per_recipes.destroy_all
    self.ingredients_per_recipes.each do |ingredient_per_recipe|
      IngredientPerRecipe.create!(
        recipe_id: original_recipe.id,
        ingredient_id: ingredient_per_recipe.ingredient_id,
        amount: ingredient_per_recipe.amount,
        unit: ingredient_per_recipe.unit
      )
    end

    self.destroy!
  end

  private

  def set_defaults
    self.steps ||= []
    self.validated = false if validated.nil?
    self.likes ||= 0
  end

  def set_restrictions
    self.vegetarian = true
    self.vegan = true
    self.celiac = true
    self.diabetic = true
  end

  def self.filter_food_restrictions(recipes, restrictions)
    recipes = recipes.where(vegan: true) if restrictions[:vegan]
    recipes = recipes.where(vegetarian: true) if restrictions[:vegetarian]
    recipes = recipes.where(celiac: true) if restrictions[:celiac]
    recipes = recipes.where(diabetic: true) if restrictions[:diabetic]
    recipes
  end

  def self.filter_food_categories(recipes, food_categories_rectrictions_ids)
    recipes.to_a.select do |recipe|
      food_categories_in_common?(food_categories_rectrictions_ids, recipe.ingredients.map(&:food_category_id))
    end
  end

  def self.food_categories_in_common?(food_categories_rectrictions_ids, ingredients_food_categories_ids)
    (food_categories_rectrictions_ids & ingredients_food_categories_ids).empty?
  end

  def self.filter_excluded_ingredients(recipes, excluded_ingredients_ids)
    recipes.to_a.select do |recipe|
      ingredients_in_common?(excluded_ingredients_ids, recipe.ingredients.map(&:id))
    end
  end

  def self.ingredients_in_common?(excluded_ingredients_ids, ingredients_ids)
    (excluded_ingredients_ids & ingredients_ids).empty?
  end

  def self.best_recipes(recipes, ingredients_ids)
    recipes.sort_by { |recipe| -recipe_weight(recipe, ingredients_ids) }.first(10)
  end

  def self.recipe_weight(recipe, ingredients_ids)
    recipe_ingredients_ids = recipe.ingredients.map(&:id)

    ingredients_matchs = (recipe_ingredients_ids & ingredients_ids).size # ingredientes que coinciden con la receta
    ingredients_left = (recipe_ingredients_ids - ingredients_ids).size # ingredientes que le sobran a la receta

    100 * ingredients_matchs - 20 * ingredients_left
  end
end
