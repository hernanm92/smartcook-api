class AddTokenToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :username, :string
    add_column :sessions, :token, :string
  end
end
