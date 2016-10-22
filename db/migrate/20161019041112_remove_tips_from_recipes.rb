class RemoveTipsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :tips, :text
  end
end
