class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image_url
      t.float :stars
      t.boolean :validated
      t.text :description
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :celiac
      t.boolean :diabetic
      t.text :steps
      t.text :tips

      t.timestamps null: false
    end
  end
end
