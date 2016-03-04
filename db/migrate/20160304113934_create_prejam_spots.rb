class CreatePrejamSpots < ActiveRecord::Migration
  def change
    create_table :prejam_spots do |t|

      t.integer :pregame_id
      t.timestamps null: false
    end
  end
end
