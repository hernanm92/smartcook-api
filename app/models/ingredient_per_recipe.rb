# == Schema Information
#
# Table name: ingredients_per_recipes
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  recipe_id     :integer
#  unit          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  amount        :float
#

class IngredientPerRecipe < ActiveRecord::Base
  self.table_name = 'ingredients_per_recipes'

  belongs_to :ingredient, class_name: 'Ingredient'
  belongs_to :recipe, class_name: 'Recipe'

  validates :ingredient_id, presence: true, numericality: { only_integer: true }
  validates :recipe_id, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, length: { in: 1..15 }

  after_create :update_recipe_restrictions
  after_destroy :update_recipe_restrictions

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end

  private

  def update_recipe_restrictions
    recipe = Recipe.find_by_id(recipe_id)

    recipe.vegetarian = vegetarian? recipe
    recipe.vegan = vegan? recipe
    recipe.celiac = celiac? recipe
    recipe.diabetic = diabetic? recipe

    recipe.save!
  end

  def vegetarian?(recipe)
    recipe.ingredients.all? { |ingredient| ingredient[:vegetarian] }
  end

  def vegan?(recipe)
    recipe.ingredients.all? { |ingredient| ingredient[:vegan] }
  end

  def celiac?(recipe)
    recipe.ingredients.all? { |ingredient| ingredient[:celiac] }
  end

  def diabetic?(recipe)
    recipe.ingredients.all? { |ingredient| ingredient[:diabetic] }
  end
end
