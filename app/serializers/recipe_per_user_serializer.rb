# == Schema Information
#
# Table name: recipes_per_users
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  user_id    :integer
#  favorite   :boolean          default(FALSE)
#  owned      :boolean          default(FALSE)
#  vote       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipePerUserSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :user_id, :favorite, :owned, :vote
end
