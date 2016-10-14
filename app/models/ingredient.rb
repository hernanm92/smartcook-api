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

class Ingredient < ActiveRecord::Base
  belongs_to :food_category

  has_many :ingredients_per_recipes, dependent: :destroy, class_name: 'IngredientPerRecipe'
  has_many :recipes, through: :ingredients_per_recipes

  has_many :ingredients_per_users, dependent: :destroy, class_name: 'IngredientPerUser'
  has_many :users, through: :ingredients_per_users

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :image_url, presence: true, uniqueness: true
  validates :food_category_id, presence: true, numericality: { only_integer: true }
  validates :vegetarian, inclusion: { in: [true, false] }
  validates :vegan, inclusion: { in: [true, false] }
  validates :celiac, inclusion: { in: [true, false] }
  validates :diabetic, inclusion: { in: [true, false] }
  validates :calories, presence: true, numericality: true
  validates :proteins, presence: true, numericality: true
  validates :carbohydrates, presence: true, numericality: true
  validates :fats, presence: true, numericality: true

  validates :food_category, presence: true
  validates :name_id, presence:true, uniqueness: true
end
