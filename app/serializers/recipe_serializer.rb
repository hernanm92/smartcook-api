# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  image_url   :string
#  stars       :float
#  validated   :boolean
#  description :text
#  vegetarian  :boolean
#  vegan       :boolean
#  celiac      :boolean
#  diabetic    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  steps       :string           default([]), is an Array
#  original    :integer
#  likes       :integer
#  votes       :float
#

class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :stars, :validated, :description, :vegetarian, :vegan, :celiac, :diabetic,
             :steps, :original, :likes, :votes
end
