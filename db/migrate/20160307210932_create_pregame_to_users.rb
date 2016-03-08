class CreatePregameToUsers < ActiveRecord::Migration
  def change
    create_table :pregame_to_users do |t|
      t.integer :pregame_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
