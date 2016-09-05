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
#  tips        :string           default([]), is an Array
#

class Recipe < ActiveRecord::Base
  has_many :ingredients_per_recipes, dependent: :destroy, class_name: 'IngredientPerRecipe'
  has_many :ingredients, through: :ingredients_per_recipes

  has_many :recipes_per_users, dependent: :destroy, class_name: 'RecipePerUser'
  has_many :users, through: :recipes_per_users

  validates :name, presence: true, uniqueness: true, length: { in: 5..50 }
  validates :description, presence: true, length: { in: 5..200 }
  validates :steps, presence: true # , length: { in: 5..50 }

  after_initialize :set_defaults
  before_create :set_restrictions

  private

  def set_defaults
    self.steps ||= []
    self.tips ||= []
  end

  def set_restrictions
    self.vegetarian = true
    self.vegan = true
    self.celiac = true
    self.diabetic = true
  end
end
