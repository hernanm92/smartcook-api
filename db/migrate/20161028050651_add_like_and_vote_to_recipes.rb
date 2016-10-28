class AddLikeAndVoteToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :likes, :integer
    add_column :recipes, :votes, :float
  end
end
