class RecipesPerUserSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :user_id, :favorite, :owned, :vote
end
