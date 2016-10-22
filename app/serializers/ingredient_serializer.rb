# == Schema Information
#
# Table name: ingredients
#
#  id               :integer          not null, primary key
#  name             :string
#  image_url        :string
#  food_category_id :integer
#  vegetarian       :boolean
#  vegan            :boolean
#  celiac           :boolean
#  diabetic         :boolean
#  calories         :integer
#  proteins         :integer
#  carbohydrates    :integer
#  fats             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name_id          :string
#

class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :food_category_id, :vegetarian, :vegan, :celiac, :diabetic,
             :calories, :proteins, :carbohydrates, :fats, :name_id
end
