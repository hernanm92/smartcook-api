class AddUserExcludedIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients_per_recipes, :excluded, :boolean
    add_column :recipes_per_users, :like, :boolean
    rename_column :recipes_per_users, :owned, :owner
  end
end
