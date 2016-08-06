class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :category_id, :vegetarian, :vegan, :celiac, :diabetic,
             :calories, :proteins, :carbohydrates, :fats
end
