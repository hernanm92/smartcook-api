class FixUserExcludedIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients_per_recipes, :excluded, :boolean
    add_column :ingredients_per_users, :excluded, :boolean
  end
end
