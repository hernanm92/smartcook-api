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

  def filter_food_restrictions(restrictions)
    vegan = restrictions[:vegan] || nil
    vegetarian = restrictions[:vegetarian] || nil
    celiac = restrictions[:celiac] || nil
    diabetic = restrictions[:diabetic] || nil
    Recipes.where(vegan: vegan, vegetarian: vegetarian, celiac: celiac, diabetic: diabetic)
  end

  def filter_food_categories(recipes, restrictions)
    food_categories_rectrictions_ids = restrictions[:food_categories].map { |food_category| food_category[:id] }

    recipes.filter do |recipe|
      food_categories_rectrictions_ids.exclude? recipe.food_category_id
    end
  end

  def best_recipes(recipes, restrictions)
    recipes.map do |recipe|
      { recipe: recipe, weight: recipe_weight(recipe, restrictions[:ingredients]) }
    end
    # podria hacer un order directamente en vez de map
  end

  def recipe_weight(recipe, ingredients)
    recipe_ingredients_ids = recipe.ingredients.map(&:id)
    ingredients_ids = ingredients.map { |ingredient| ingredient[:id] }

    ingredients_matchs = (recipe_ingredients_ids & ingredients_ids).size # ingredientes que coinciden con la receta
    ingredients_left = (recipe_ingredients_ids - ingredients_ids).size # ingredientes que le sobran a la receta

    100 * ingredients_matchs - 20 * ingredients_left
  end
end
