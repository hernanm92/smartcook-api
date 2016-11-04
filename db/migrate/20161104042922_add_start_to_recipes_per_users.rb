class AddStartToRecipesPerUsers < ActiveRecord::Migration
  def change
    remove_column :recipes_per_users, :vote, :integer
    remove_column :recipes, :votes, :float
    add_column :recipes_per_users, :stars, :integer
  end
end
