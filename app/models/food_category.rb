# == Schema Information
#
# Table name: food_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodCategory < ActiveRecord::Base
  has_many :food_categories_per_users, dependent: :destroy, class_name: 'FoodCategoryPerUser'
  has_many :users, through: :food_categories_per_users

  has_many :ingredients, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { in: 5..15 }
end
