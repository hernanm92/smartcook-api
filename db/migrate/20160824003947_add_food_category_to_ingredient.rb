class AddFoodCategoryToIngredient < ActiveRecord::Migration
  def change
    rename_column :ingredients, :category_id, :food_category_id
  end
end
