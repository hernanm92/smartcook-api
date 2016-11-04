# == Schema Information
#
# Table name: recipes_per_users
#
#  id                  :integer          not null, primary key
#  recipe_id           :integer
#  user_id             :integer
#  favorite            :boolean          default(FALSE)
#  owner               :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  username            :string
#  like                :boolean
#  validated           :boolean
#  positive_validation :boolean
#  stars               :integer
#

class RecipePerUserSerializer < ActiveModel::Serializer
  attributes :recipe_id, :username, :favorite, :owner, :stars, :like, :validated, :positive_validation
end
