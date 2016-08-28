class CreateRecipesPerUsers < ActiveRecord::Migration
  def change
    create_table :recipes_per_users do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.boolean :favorite, default: false
      t.boolean :owned, default: false
      t.integer :vote

      t.timestamps null: false
    end

    add_foreign_key "recipes_per_users", "recipes"
    add_foreign_key "recipes_per_users", "users"
  end
end
