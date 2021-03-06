# == Schema Information
#
# Table name: ingredients_per_users
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  username      :string
#  excluded      :boolean
#

class IngredientPerUserSerializer < ActiveModel::Serializer
  attributes :username, :ingredient_id, :excluded
end
