class ChangeAmountToIngredientsPerRecipes < ActiveRecord::Migration
  def change
    remove_column :ingredients_per_recipes, :amount, :integer
    add_column :ingredients_per_recipes, :amount, :float
  end
end
