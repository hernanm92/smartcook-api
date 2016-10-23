class AddPositiveValidationToRecipesPerUsers < ActiveRecord::Migration
  def change
    add_column :recipes_per_users, :positive_validation, :boolean
  end
end
