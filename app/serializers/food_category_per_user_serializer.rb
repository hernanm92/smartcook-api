# == Schema Information
#
# Table name: food_categories_per_users
#
#  id               :integer          not null, primary key
#  food_category_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class FoodCategoryPerUserSerializer < ActiveModel::Serializer
  attributes :id
end
