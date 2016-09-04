class CreateFrequentUsers < ActiveRecord::Migration
  def change
    create_table :frequent_users do |t|
      t.integer :user_id
      t.integer :frecuent_user_id

      t.timestamps null: false
    end

    add_foreign_key "frequent_users", "users"
    add_foreign_key "frequent_users", "frequent_users"
  end
end
