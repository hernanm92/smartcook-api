# == Schema Information
#
# Table name: ingredients
#
#  id            :integer          not null, primary key
#  name          :string
#  image_url     :string
#  category_id   :integer
#  vegetarian    :boolean
#  vegan         :boolean
#  celiac        :boolean
#  diabetic      :boolean
#  calories      :integer
#  proteins      :integer
#  carbohydrates :integer
#  fats          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
