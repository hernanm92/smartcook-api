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
#  tips        :string           default([]), is an Array
#

class Recipe < ActiveRecord::Base
  has_many :ingredients_per_recipes, dependent: :destroy, class_name: 'IngredientPerRecipe'
  has_many :ingredients, through: :ingredients_per_recipes

  has_many :recipes_per_users, dependent: :destroy, class_name: 'RecipePerUser'
  has_many :users, through: :recipes_per_users

  validates :name, presence: true, uniqueness: true, length: { in: 5..50 }
  validates :description, presence: true, length: { in: 5..200 }
  validates :steps, presence: true # , length: { in: 5..50 }

  after_initialize :set_defaults
  before_create :set_restrictions

  def self.search(restrictions)
    recipes = filter_food_restrictions restrictions
    recipes = filter_food_categories recipes, restrictions
    best_recipes recipes, restrictions
  end

  private

  def set_defaults
    self.steps ||= []
    self.tips ||= []
  end

  def set_restrictions
    self.vegetarian = true
    self.vegan = true
    self.celiac = true
    self.diabetic = true
  end

  def self.filter_food_restrictions(restrictions)
    recipes = Recipe.all
    recipes = recipes.where(vegan: true) if restrictions[:vegan]
    recipes = recipes.where(vegetarian: true) if restrictions[:vegetarian]
    recipes = recipes.where(celiac: true) if restrictions[:celiac]
    recipes = recipes.where(diabetic: true) if restrictions[:diabetic]
    recipes
  end

  def self.filter_food_categories(recipes, restrictions)
    food_categories_rectrictions_ids = restrictions[:food_categories].map { |food_category| food_category[:id] }

    recipes.to_a.select do |recipe|
      !food_categories_in_common?(food_categories_rectrictions_ids, recipe.ingredients.map(&:food_category_id))
    end
  end

  def self.food_categories_in_common?(food_categories_rectrictions_ids, ingredients_food_categories_ids)
    (food_categories_rectrictions_ids & ingredients_food_categories_ids).empty?
  end

  def self.best_recipes(recipes, restrictions)
    recipes.sort_by { |recipe| -recipe_weight(recipe, restrictions[:ingredients]) }.first(10)
  end

  def self.recipe_weight(recipe, ingredients)
    recipe_ingredients_ids = recipe.ingredients.map(&:id)
    ingredients_ids = ingredients.map { |ingredient| ingredient[:id] }

    ingredients_matchs = (recipe_ingredients_ids & ingredients_ids).size # ingredientes que coinciden con la receta
    ingredients_left = (recipe_ingredients_ids - ingredients_ids).size # ingredientes que le sobran a la receta

    100 * ingredients_matchs - 20 * ingredients_left
  end
end
