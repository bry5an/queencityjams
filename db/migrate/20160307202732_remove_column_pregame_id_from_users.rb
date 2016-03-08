class RemoveColumnPregameIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pregame_id, :integer
  end
end
