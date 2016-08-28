class CreateIngredientsPerRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_per_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.integer :amount
      t.string :unit

      t.timestamps null: false
    end

    add_foreign_key "ingredients_per_recipes", "ingredients"
    add_foreign_key "ingredients_per_recipes", "recipes"
  end
end
