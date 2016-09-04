class CreateFrequentUsers < ActiveRecord::Migration
  def change
    create_table :frequent_users do |t|
      t.integer :user_id
      t.integer :frecuent_user_id

      t.timestamps null: false
    end
  end
end
