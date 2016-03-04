class CreateEventArtists < ActiveRecord::Migration
  def change
    create_table :event_artists do |t|
      
      t.integer :event_id
      t.string :artist_uri
      t.string :artist_name
      t.integer :artist_id
      t.string :performance_name
      t.integer :billing_index
      t.integer :performance_id
      t.string :billing
      

      t.timestamps null: false
    end
  end
end
