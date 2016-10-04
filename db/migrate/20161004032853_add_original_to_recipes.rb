class AddOriginalToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :original, :integer
  end
end
