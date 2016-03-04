class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer :songkick_event_id
      t.string :type
      t.string :uri
      t.string :event_name
      t.timestamp :start_time
      t.timestamp :start_date
      t.timestamp :start_datetime
      t.string :city
      t.float :longitude
      t.float :latitude
      t.integer :venue_id
      t.string :venue_name
      t.string :venue_uri
      t.float :venue_longitude
      t.float :venue_latitude
      t.string :venue_metro_uri
      t.string :venue_metro_name
      t.string :venue_metro_country_name
      t.integer :venue_metro_id
      t.string :venue_metro_state_name
      t.float :popularity
      
      t.timestamps null: false
    end
    
    add_index :events, :songkick_event_id,   unique: true
  end
end
