class CreateIngredientsPerUsers < ActiveRecord::Migration
  def change
    create_table :ingredients_per_users do |t|
      t.integer :ingredient_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_foreign_key "ingredients_per_users", "ingredients"
    add_foreign_key "ingredients_per_users", "users"
  end
end
