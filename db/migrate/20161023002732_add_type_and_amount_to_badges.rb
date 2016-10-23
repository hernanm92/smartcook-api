class AddTypeAndAmountToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :type, :string
    add_column :badges, :amount, :integer
  end
end
