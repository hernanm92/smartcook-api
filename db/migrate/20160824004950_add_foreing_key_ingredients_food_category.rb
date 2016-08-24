class AddForeingKeyIngredientsFoodCategory < ActiveRecord::Migration
  def change
    add_foreign_key "ingredients", "food_categories"
  end
end
