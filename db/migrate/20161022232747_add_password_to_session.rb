class AddPasswordToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :password, :string
  end
end
