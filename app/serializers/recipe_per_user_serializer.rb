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
#  username   :string
#

class RecipePerUserSerializer < ActiveModel::Serializer
  attributes :recipe_id, :username, :favorite, :owned, :vote
end
