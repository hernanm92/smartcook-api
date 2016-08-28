class EditRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :steps, :string
    remove_column :recipes, :tips, :string

    add_column :recipes, :steps, :string, array: true, default: []
    add_column :recipes, :tips, :string, array: true, default: []
  end
end
