class CreateCategoriesPerUsers < ActiveRecord::Migration
  def change
    create_table :food_categories_per_users do |t|
      t.integer :food_category_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_foreign_key "food_categories_per_users", "food_categories"
    add_foreign_key "food_categories_per_users", "users"
  end
end
