class ChangeTypeToBadgeType < ActiveRecord::Migration
  def change
    remove_column :badges, :type, :string
    add_column :badges, :badge_type, :string
  end
end
