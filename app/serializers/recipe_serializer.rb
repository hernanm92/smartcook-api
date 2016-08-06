class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :stars, :validated, :description, :vegetarian, :vegan, :celiac, :diabetic,
             :steps, :tips
end
