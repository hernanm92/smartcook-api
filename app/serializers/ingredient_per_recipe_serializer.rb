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

class IngredientPerRecipeSerializer < ActiveModel::Serializer
  attributes :id, :ingredient_id, :recipe_id, :amount, :unit
end
