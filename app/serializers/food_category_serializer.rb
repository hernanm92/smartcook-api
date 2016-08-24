# == Schema Information
#
# Table name: food_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodCategorySerializer < ActiveModel::Serializer
  attributes :id, :name
end
