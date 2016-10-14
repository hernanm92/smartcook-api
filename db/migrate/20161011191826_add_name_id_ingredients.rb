class AddNameIdIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :name_id, :string
  end
end
