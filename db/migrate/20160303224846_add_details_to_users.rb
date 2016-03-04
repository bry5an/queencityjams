class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pregame_id, :integer
    add_column :users, :username, :string
  end
end
