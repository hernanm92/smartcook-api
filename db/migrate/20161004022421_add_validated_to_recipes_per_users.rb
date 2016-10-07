class AddValidatedToRecipesPerUsers < ActiveRecord::Migration
  def change
    add_column :recipes_per_users, :validated, :boolean
  end
end
