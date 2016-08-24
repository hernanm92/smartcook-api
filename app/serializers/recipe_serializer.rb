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
#  steps       :text
#  tips        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :stars, :validated, :description, :vegetarian, :vegan, :celiac, :diabetic,
             :steps, :tips
end
