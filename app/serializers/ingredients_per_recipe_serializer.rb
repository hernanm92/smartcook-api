class IngredientsPerRecipeSerializer < ActiveModel::Serializer
  attributes :id, :ingredient_id, :recipe_id, :amount, :unit
end
