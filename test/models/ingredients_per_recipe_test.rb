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

require 'test_helper'

class IngredientPerRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
