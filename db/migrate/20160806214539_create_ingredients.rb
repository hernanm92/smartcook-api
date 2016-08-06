class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :image_url
      t.integer :category_id
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :celiac
      t.boolean :diabetic
      t.integer :calories
      t.integer :proteins
      t.integer :carbohydrates
      t.integer :fats

      t.timestamps null: false
    end
  end
end
