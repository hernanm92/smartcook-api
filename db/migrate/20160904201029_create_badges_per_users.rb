class CreateBadgesPerUsers < ActiveRecord::Migration
  def change
    create_table :badges_per_users do |t|
      t.integer :badge_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_foreign_key "badges_per_users", "badges"
    add_foreign_key "badges_per_users", "users"
  end
end
