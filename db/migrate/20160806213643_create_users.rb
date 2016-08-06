class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password
      t.string :avatar
      t.datetime :birthdate
      t.string :gender
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :celiac
      t.boolean :diabetic

      t.timestamps null: false
    end
  end
end
