class EventArtist < ActiveRecord::Base
  
  belongs_to :event
  
  def link_id
    event = Event.where(songkick_event_id: self.songkick_event_id).map(&:id)
    self.event_id = event[0]
    self.save!
  end
  
end
