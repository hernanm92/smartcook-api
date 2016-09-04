class AddUsernameToRelations < ActiveRecord::Migration
  def change
    add_column :badges_per_users, :username, :string
    add_column :food_categories_per_users, :username, :string
    add_column :ingredients_per_users, :username, :string
    add_column :recipes_per_users, :username, :string
    add_column :frequent_users, :username, :string
    add_column :frequent_users, :frecuent_username, :string
  end
end
