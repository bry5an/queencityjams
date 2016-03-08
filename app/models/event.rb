class Event < ActiveRecord::Base
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  has_many :event_artists
  has_many :pregames
  
  
  paginates_per 7
  
  def artists
    EventArtist.where(event_id: self.songkick_event_id)
  end
  
  def self.search(search)
    if search
      where('event_name like ?', "%#{search}%")
    else
      nil
    end
  end

  def headliner
    self.event_artists.each do |artist|
      if artist.billing_index == 1
        return artist.artist_name
      end
    end
  end
  
  def supporting
    support = []
    self.event_artists.each do |artist|
      if artist.billing_index != 1
        support << artist.artist_name
      end
    end
    return support
  end
end
