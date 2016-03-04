class RemoveColumnEventIdFromEventArtist < ActiveRecord::Migration
  def change
    remove_column :event_artists, :event_id, :integer
  end
end
