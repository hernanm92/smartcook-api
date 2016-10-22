class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.text :description
      t.integer :recipe_id
      t.string :username

      t.timestamps null: false
    end

    add_foreign_key "tips", "recipes"
  end
end
