class AddEventIdColumnToEventArtists < ActiveRecord::Migration
  def change
    add_column :event_artists, :event_id, :integer
    
    add_index :event_artists, :event_id

  end
end
