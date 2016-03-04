class AddColumnSongkickEventIdToEventArtists < ActiveRecord::Migration
  def change
    add_column :event_artists, :songkick_event_id, :integer
  end
end
