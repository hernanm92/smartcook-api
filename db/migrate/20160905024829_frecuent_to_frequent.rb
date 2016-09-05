class FrecuentToFrequent < ActiveRecord::Migration
  def change
    rename_column :frequent_users, :frecuent_user_id, :frequent_user_id
    rename_column :frequent_users, :frecuent_username, :frequent_username
  end
end
