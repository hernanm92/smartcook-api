# == Schema Information
#
# Table name: ingredients_per_recipes
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  recipe_id     :integer
#  amount        :integer
#  unit          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class IngredientPerRecipe < ActiveRecord::Base
  self.table_name = 'ingredients_per_recipes'

  belongs_to :ingredient
  belongs_to :recipe

  validates :ingredient_id, presence: true, numericality: { only_integer: true }
  validates :recipe_id, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, length: { in: 1..15 }

  def self.find_by!(params)
    params[:id] = params.delete(:id) if params[:id]
    super params
  end
end
